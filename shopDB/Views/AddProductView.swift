//
//  AddProductView.swift
//  shopDB
//
//  Created by iSero on 05/06/2021.
//

import SwiftUI

struct AddProductView: View {
    @EnvironmentObject var API : NetworkManager
    @State private var nazwa = ""
    @State private var opis = ""
    @State private var zdjecie = ""
    @State private var netto = ""
    @State private var podatek = ""
    @State private var kategoria = ""
    var body: some View {
        ZStack{
            Color("color2")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Add product")
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                    .foregroundColor(Color("color1"))
                Divider()
                VStack{
                    
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.white)
                        .overlay(
                            TextField("Nazwa",text: self.$nazwa)
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
                            TextField("Opis",text: $opis)
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
                            TextField("zdjecie",text: $zdjecie)
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
                            TextField("netto",text: $netto)
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
                            TextField("Podatek",text: $podatek)
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
                            TextField("Kategoria",text: $kategoria)
                                .cornerRadius(100)
                                .foregroundColor(Color("color4"))
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .frame(minHeight:30)
                            
                        )
                        .frame(height: 50)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    Button(action: {
                            DispatchQueue.main.async {
                                self.API.addProduct(nazwa: nazwa, opis: opis, zdjecie: zdjecie, netto: StringToDouble(val:netto), podatek: StringToDouble(val:podatek), kategoria: Int(kategoria) ?? 0)}}, label: {
                                    roundedButton(text: "Add product")
                                        .padding()
                                })
                    Spacer()
                }
            }}}
    
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}

func StringToDouble(val:String) -> Double{
    if let cost = Double(val) {
        return cost
    } else {
        return 0;
    }
    
}
