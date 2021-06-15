//
//  RegisterView.swift
//  shopDB
//
//  Created by iSero on 23/05/2021.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var API = NetworkManager()
    @State private var email = ""
    @State private var password = ""
    @State private var wiek = ""
    @State private var plec = 0
    @State private var numerBudynku = ""
    @State private var ulica = ""
    @State private var kodpocztowy = ""
    @State private var numerMieszkania = ""
    @State private var miasto = ""
    @State private var imie = ""
    @State private var nazwisko = ""
    
    var body: some View {
        ZStack{
            Color("color2")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
            VStack{
                HStack{
                    Image(systemName: "bag.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .foregroundColor(Color("color3"))
                    Text("ShopDB")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("color3"))
                        .padding()
                }
                registerFields(email: email, password: password, wiek: wiek, plec: plec, numerBudynku: numerBudynku, ulica: ulica, kodpocztowy: kodpocztowy, numerMieszkania: numerMieszkania, miasto: miasto,imie: imie,nazwisko: nazwisko)
                Spacer()
                    .padding()
            }}
        }
        
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
func register(){
    //
}
struct textField: View{
    var placeholder: String
    @State var text: String
    var body: some View{
        RoundedRectangle(cornerRadius: 100)
            .foregroundColor(.white)
            .overlay(
                TextField("\(placeholder)",text: $text)
                    .cornerRadius(100)
                    .foregroundColor(Color("color4"))
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                    .frame(minHeight:30)
                
            )
            .frame(height: 50)
            .padding(.horizontal)
            .shadow(radius: 10)
    }
    
    
}

struct registerFields:View{
    var email:String
    var password :String
    var wiek :String
    var plec: Int
    var numerBudynku :String
    var ulica :String
    var kodpocztowy :String
    var numerMieszkania :String
    var miasto :String
    var imie:String
    var nazwisko:String
    var body: some View{
                VStack{
                    Group{
                    textField(placeholder: "Imie", text: imie)
                    textField(placeholder: "Naziwsko", text: nazwisko)
            textField(placeholder: "Email", text: email)
            textField(placeholder: "Haslo", text: password)
            textField(placeholder: "wiek", text:wiek)
            
            textField(placeholder: "ulica", text:ulica)
            textField(placeholder: "numerBudynku", text:numerBudynku)
            textField(placeholder: "numerMieszkania", text:numerMieszkania)
            textField(placeholder: "kodpocztowy", text:kodpocztowy)
            textField(placeholder: "miasto", text:miasto)
                    }
            NavigationLink(
                destination: SettingsView(),
                label: {
                    roundedButton(text: "Register")
                        .padding()
                })
            //Button(action: register){roundedButton(text: "Register")}
        }
        
    }
}
