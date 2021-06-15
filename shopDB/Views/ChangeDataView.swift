//
//  ChangeDataView.swift
//  shopDB
//
//  Created by iSero on 04/06/2021.
//

import SwiftUI

struct ChangeDataView: View {
    @EnvironmentObject var API : NetworkManager
    @State private var password = ""
    @State private var wiek = ""
    @State private var numerBudynku = ""
    @State private var ulica = ""
    @State private var kodpocztowy = ""
    @State private var numerMieszkania = ""
    @State private var miasto = ""
    var body: some View {
        ZStack{
            Color("color2")
                .edgesIgnoringSafeArea(.all)
        VStack{
        Text("Change password")
            .bold()
            .font(.system(size: 30))
            .padding()
            .foregroundColor(Color("color1"))
            Divider()
            VStack{
               
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.white)
                    .overlay(
                        TextField("Ulica",text: $ulica)
                            .cornerRadius(100)
                            .foregroundColor(Color("color4"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(minHeight:30)
                            
                        
                    )
                    .frame(height: 50)
                    .padding(.horizontal)
                    .shadow(radius: 10)
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.white)
                    .overlay(
                        TextField("Numer budynku",text: $numerBudynku)
                            .cornerRadius(100)
                            .foregroundColor(Color("color4"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(minHeight:30)
                            .keyboardType(.numberPad)
                        
                    )
                    .frame(height: 50)
                    .padding(.horizontal)
                    .shadow(radius: 10)
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.white)
                    .overlay(
                        TextField("Numer mieszkania",text: $numerMieszkania)
                            .cornerRadius(100)
                            .foregroundColor(Color("color4"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(minHeight:30)
                            .keyboardType(.numberPad)
                        
                    )
                    .frame(height: 50)
                    .padding(.horizontal)
                    .shadow(radius: 10)
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.white)
                    .overlay(
                        TextField("Kod pocztowy",text: $kodpocztowy)
                            .cornerRadius(100)
                            .foregroundColor(Color("color4"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(minHeight:30)
                            .keyboardType(.numberPad)
                        
                    )
                    .frame(height: 50)
                    .padding(.horizontal)
                    .shadow(radius: 10)
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.white)
                    .overlay(
                        TextField("Miasto",text: $miasto)
                            .cornerRadius(100)
                            .foregroundColor(Color("color4"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(minHeight:30)
                        
                    )
                    .frame(height: 50)
                    .padding(.horizontal)
                    .shadow(radius: 10)
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.white)
                    .overlay(
                        TextField("Password",text: $password)
                            .cornerRadius(100)
                            .foregroundColor(Color("color4"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(minHeight:30)
                        
                    )
                    .frame(height: 50)
                    .padding(.horizontal)
                    .shadow(radius: 10)
                Button(action: changeAddress){roundedButton(text: "Change!")}
                    .padding()
                Spacer()
            }
        }}
    }
    func changeAddress(){
        print("change")
        DispatchQueue.main.async {
            self.API.changeAddress(ulica: self.ulica, nrbudynku: Int(self.numerBudynku) ?? 404, nrmieszkania: Int(self.numerMieszkania) ?? 404, kodpocztowy: self.kodpocztowy, miasto: self.miasto)
        }
    }
}

struct ChangeDataView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeDataView()
    }
}
