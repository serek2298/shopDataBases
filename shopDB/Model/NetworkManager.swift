//
//  NetworkManager.swift
//  shopDB
//
//  Created by iSero on 24/05/2021.
//

import Foundation
import UIKit

enum status{
    case Success
    case Failure
}

protocol NetworkManagerDelegate{
    func didFinieshed(with: status)
}

class NetworkManager : ObservableObject{
    @Published var items = [Produkt]()
    @Published var koszyk = [Produkt]()
    @Published var search = [Produkt]()
    @Published var isLogged : Bool = false
    @Published var addingToBasketSuccess : Bool = false
    @Published var addingToBasketFailure : Bool = false
    @Published var removeFromBasketSuccess : Bool = false
    @Published var removeFromBasketFailure : Bool = false
    @Published var orderSuccess : Bool = false
    @Published var orderFailure : Bool = false
    var user = Uzytkownik(imie: "", nazwisko: "", email: "", haslo: "", statuskonta: 0)
    let baseUrl = "http://192.168.1.24:8000/baza/"
    
    func login(email:String,password:String){
        if let url = URL(string: "\(baseUrl)logowanie/?email=\(email)&haslo=\(password)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    let decoder = JSONDecoder()
                    
                    if let safeData = data{
                        do{
                            
                            let res = try decoder.decode([loginData].self,from:safeData)
                            print("Logged succesfully")
                            DispatchQueue.main.async {
                            self.user = Uzytkownik(imie: res[0].fields.imie!,
                                                   nazwisko: res[0].fields.nazwisko!,
                                                   email: res[0].fields.email!,
                                                   haslo: res[0].fields.haslo!,
                                                   statuskonta: res[0].fields.statuskonta!)
                            self.isLogged = true
                            }
                        }catch{
                            self.isLogged = false
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func getMain(){
        if let url = URL(string: "\(baseUrl)produkty")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    let decoder = JSONDecoder()
                    
                    if let safeData = data{
                        do{
                            let results = try decoder.decode([mainData].self,from:safeData)
                            var produkty = [Produkt]()
                           
                            for item in results.reversed(){
                                produkty.append(Produkt(id: String(item.pk), nazwa: item.fields.nazwa, opis: item.fields.opis, zdjecie: item.fields.zdjecie, netto: item.fields.netto, brutto: item.fields.brutto, podatek: item.fields.podatek, kategoria: item.fields.kategoria))
                            }
                            DispatchQueue.main.async {
                            self.items = produkty
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    func findProduct(product_id:String){
        if let url = URL(string: "\(baseUrl)znajdz_produkt/?idproduktu=\(product_id)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    let decoder = JSONDecoder()
                    
                    if let safeData = data{
                        do{
                            if(response?.expectedContentLength == Optional(1)){
                                return
                            }
                            let results = try decoder.decode([mainData].self,from:safeData)
                            for n in 1...self.koszyk.count{
                                if(product_id == self.koszyk[n-1].id ){
                                    self.koszyk[n-1].nazwa = results[0].fields.nazwa
                                    self.koszyk[n-1].opis = results[0].fields.opis
                                    self.koszyk[n-1].zdjecie = results[0].fields.zdjecie
                                    self.koszyk[n-1].netto = results[0].fields.netto
                                    self.koszyk[n-1].brutto = results[0].fields.brutto
                                    self.koszyk[n-1].podatek = results[0].fields.podatek
                                    self.koszyk[n-1].kategoria = results[0].fields.kategoria
                                    break
                                }
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    func getBasket(email:String,password:String){
        if let url = URL(string: "\(baseUrl)koszyk/?email=\(email)&haslo=\(password)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            if(response?.expectedContentLength == Optional(1)){
                                return
                            }
                            let results = try decoder.decode([basketData].self,from:safeData)
                            self.koszyk = [Produkt]()
                            for n in 1...results.count{
                                self.koszyk.append(Produkt(id: String(results[n-1].fields.idproduktow),
                                                           ilosc: results[n-1].fields.ilosc))
                                self.findProduct(product_id:String(results[n-1].fields.idproduktow))
                            }
                        }catch{
                            print("COS SIE POSULO W GET BASKET")
                        }
                    }
                }
            }
            task.resume()
        }
    }
    func getAddress(){
        if let url = URL(string: "\(baseUrl)adres/?email=\(self.user.email)&haslo=\(self.user.haslo)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    let decoder = JSONDecoder()
                    
                    if let safeData = data{
                        do{
                            let res = try decoder.decode([addressData].self,from:safeData)
                            print("Address fetched succesfully")
                            self.user.plec = res[0].fields.plec
                            self.user.wiek = res[0].fields.wiek
                            self.user.ulica = res[0].fields.ulica.replacingOccurrences(of: "ł", with: "l").replacingOccurrences(of: "ą", with: "a").replacingOccurrences(of: "ó", with: "o")
                            self.user.numerbudynku = res[0].fields.numerbudynku
                            self.user.numermieszkania = res[0].fields.numermieszkania
                            self.user.kodpocztowy = res[0].fields.kodpocztowy
                            self.user.miasto = res[0].fields.miasto.replacingOccurrences(of: "ł", with: "l").replacingOccurrences(of: "ą", with: "a").replacingOccurrences(of: "ó", with: "o")
                            self.user.nip = res[0].fields.nip
                        }catch{
                            print("Address fetching failed")
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    func szukaj(category:Int){
        if let url = URL(string: "\(baseUrl)szukaj/?kategoria=\(category)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    let decoder = JSONDecoder()
                    
                    if let safeData = data{
                        do{
                            
                            let results = try decoder.decode([mainData].self,from:safeData)
                            var szukaj = [Produkt]()
                            for item in results{
                                szukaj.append(Produkt(id: String(item.pk), nazwa: item.fields.nazwa, opis: item.fields.opis, zdjecie: item.fields.zdjecie, netto: item.fields.netto, brutto: item.fields.brutto, podatek: item.fields.podatek, kategoria: item.fields.kategoria))
                            }
                            self.search = szukaj
                        }catch{
                            print(error)
                            
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    func addToBasket(productID:String,amount:Int){
        if let url = URL(string: "\(baseUrl)dodaj_do_koszyka/?email=\(user.email)&haslo=\(user.haslo)&idproduktu=\(productID)&ilosc=\(amount)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if let httpresponse = response as? HTTPURLResponse{
                    if httpresponse.statusCode == 200{
                        print("Successfuly added product to basket ... updating basket")
                        DispatchQueue.main.async{
                        self.getBasket(email: self.user.email, password: self.user.haslo)
                            self.addingToBasketSuccess = true
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
    func removeFromBasket(productID:String){
        if let url = URL(string: "\(baseUrl)usun_z_koszyka/?email=\(user.email)&haslo=\(user.haslo)&idproduktu=\(productID)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    if let httpresponse = response as? HTTPURLResponse{
                        if httpresponse.statusCode == 200{
                            for n in 1...self.koszyk.count{
                                if self.koszyk[n-1].id == productID{
                                    self.koszyk.remove(at: n-1)
                                    print("Seccesfully removed product \(productID) from basket.")
                                }
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func buy(){
        let url = "\(baseUrl)zakup/?email=\(user.email)&haslo=\(user.haslo)&ulica=\(user.ulica!)&nrbudynku=\(user.numerbudynku!)&nrmieszkania=\(user.numermieszkania!)&kodpocztowy=\(user.kodpocztowy!)&miasto=\(user.miasto!)&sposobplatnosci=0"
        if let url = URL(string: url)
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                let httpresponse = response as? HTTPURLResponse
                if(httpresponse?.statusCode == 200){
                    print("Zakupiles przedmioty")
                    self.koszyk = [Produkt]()
                }
            }
            task.resume()
        }}
    func changePassword(newPassword:String){
        if let url = URL(string: "\(baseUrl)zmien_haslo/?email=\(user.email)&haslo=\(user.haslo)&nowe_haslo=\(newPassword)")
        {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    _ = JSONDecoder()
                    self.user.haslo = newPassword
                    if data != nil{
                        print( "changepassword completed succesfully")
                    }
                }
            }
            task.resume()
        }
    }
    func changeEmail(newEmail:String){
        if let url = URL(string: "\(baseUrl)zmien_email/?email=\(user.email)&haslo=\(user.haslo)&nowe_haslo=\(newEmail)")
        {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    _ = JSONDecoder()
                    self.user.email = newEmail
                    if data != nil{
                        print("email changed succesfully")
                    }
                }
            }
            task.resume()
        }
    }
    func changeAddress(ulica:String,nrbudynku:Int,nrmieszkania:Int,kodpocztowy:String,miasto:String){
        if let url = URL(string: "\(baseUrl)zmien_adres/?email=\(user.email)&haslo=\(user.haslo)&ulica=\(ulica)&nrbudynku=\(nrbudynku)&nrmieszkania=\(nrmieszkania)&kodpocztowy=\(kodpocztowy)&miasto=\(miasto)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    _ = JSONDecoder()
                    if data != nil{
                        print("changeaddress Response")
                    }
                }
            }
            task.resume()
        }
    }
    func addProduct(nazwa:String,opis:String,zdjecie:String,netto:Double,podatek:Double,kategoria:Int){
        if(self.user.statuskonta == 1){
            if let url = URL(string: "\(baseUrl)dodaj_produkt/?email=\(user.email)&haslo=\(user.haslo)&nazwa=\(nazwa)&opis=\(opis)&zdjecie=\(zdjecie)&netto=\(netto)&podatek=\(podatek)&kategoria=\(kategoria)")
            {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url){
                    (data,response,error) in
                    if(error == nil){
                        _ = JSONDecoder()
                        print("DODANO PRODUKT")
                        if data != nil{
                            print("addprodukt Response")
                        }
                    }
                }
                task.resume()
            }}
    }
    func deleteProduct(nazwa:String,productID:String){
        if(self.user.statuskonta == 1){
            if let url = URL(string: "\(baseUrl)usun_produkt/?email=\(user.email)&haslo=\(user.haslo)&nazwa=\(nazwa)&idproduktu=\(productID)")
            {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url){
                    (data,response,error) in
                    if(error == nil){
                        _ = JSONDecoder()
                        if data != nil{
                            print(response ?? "addprodukt Response")
                        }
                    }
                }
                task.resume()
            }}
    }
    func modifyProduct(nazwa:String,opis:String,zdjecie:String,netto:Double,podatek:Double,kategoria:Int,productID:String){
        if(self.user.statuskonta == 1){
            if let url = URL(string: "\(baseUrl)zmien_produkt/?email=\(user.email)&haslo=\(user.haslo)&idproduktu=\(productID)&nazwa=\(nazwa)&opis=\(opis)&zdjecie=\(zdjecie)&netto=\(netto)&podatek=\(podatek)&kategoria=\(kategoria)")
            {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url){
                    (data,response,error) in
                    if(error == nil){
                        _ = JSONDecoder()
                        if data != nil{
                            print( "modifyprodukt Response")
                        }
                    }
                }
                task.resume()
            }
        }}
    func changePermissions(user_id:String,new_status:String){
        if(self.user.statuskonta == 1){
            if let url = URL(string: "\(baseUrl)zmien_status/?email=\(user.email)&haslo=\(user.haslo)&id_uzytkownika=\(user_id)&nowy_status=\(new_status)")
            {
                print(url)
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url){
                    (data,response,error) in
                    if(error == nil){
                        _ = JSONDecoder()
                        if data != nil{
                            print("change permission Response")
                        }
                    }
                }
                task.resume()
            }
        }}
    func register(email:String,haslo:String,plec:Int,wiek:Int,ulica:String,nrbudynku:Int,nrmieszkania:Int,kodpocztowy:String,miasto:String){
        if let url = URL(string: "\(baseUrl)rejestracja/?email=\(user.email)&haslo=\(user.haslo)&plec=\(plec)&wiek=\(wiek)&ulica=\(ulica)&nrbudynku=\(nrbudynku)&nrmieszkania=\(nrmieszkania)&kodpocztowy=\(kodpocztowy)&miasto=\(miasto)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if(error == nil){
                    _ = JSONDecoder()
                    if data != nil{
                        print("register Response")
                    }
                }
            }
            task.resume()
        }
    }
    
}
