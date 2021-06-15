//
//  networkData.swift
//  shopDB
//
//  Created by iSero on 24/05/2021.
//

import Foundation

struct loginItem:Decodable{
    
}
struct loginData: Codable{
    var model: String
    var pk: Int
    var fields: User
}

struct addressData: Codable{
    var model: String
    var pk: Int
    var fields: Address
}
struct Address: Codable{
    var plec:Int
    var wiek:Int
    var ulica:String
    var numerbudynku:Int
    var numermieszkania:Int
    var miasto:String
    var kodpocztowy:String
    var nip:Int
    
    
}
struct mainData : Codable{
    var model: String
    var pk: Int
    var fields: Product
}

struct basketData:Codable{
    var model:String
    var pk:Int
    var fields: basket
}
struct Product: Codable{
    var nazwa: String
    var opis: String
    var zdjecie: String
    var netto: Double
    var brutto: Double
    var podatek: Double
    var kategoria: Int
    
}
struct Produkt:Identifiable{
    var id:String?
    var nazwa: String?
    var opis: String?
    var zdjecie: String?
    var netto: Double?
    var brutto: Double?
    var podatek: Double?
    var kategoria: Int?
    var ilosc: Int?
}

struct User:Codable{
    var iduzytkownicy: Int?
    var imie:String?
    var nazwisko:String?
    var email:String?
    var haslo:String?
    var statuskonta:Int?
    var plec:Int?
    var wiek:Int?
    var ulica:String?
    var numerbudynku:Int?
    var numermieszkania:Int?
    var miasto:String?
    var kodpocztowy:String?
    var nip:Int?
    
}
struct Uzytkownik{
    var imie:String
    var nazwisko:String
    var email:String
    var haslo:String
    var statuskonta:Int
    var plec:Int?
    var wiek:Int?
    var ulica:String?
    var numerbudynku:Int?
    var numermieszkania:Int?
    var miasto:String?
    var kodpocztowy:String?
    var nip:Int?
}

struct basket:Codable{
    var idkoszyk:Int
    var idproduktow:Int
    var ilosc:Int
    var status:Int
    var iduzytkownik:Int
}
struct historyData{
    var model:String
    var pk:Int
    var fields:History
}
struct History{
    var iduzytkownika:Int
    var idkoszyka:Int
    var numerbudynku:Int
    var numermieszkania:Int
    var kodpocztowy:String
    var miasto:String
    var sposobplatnosci:Int
    var statusrealizacji:Int
    var datazamowienia:String
    
}

