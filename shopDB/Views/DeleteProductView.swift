//
//  DeleteProductView.swift
//  shopDB
//
//  Created by iSero on 05/06/2021.
//

import SwiftUI

struct DeleteProductView: View {
    @EnvironmentObject var API : NetworkManager
    @State private var nazwa = ""
    @State private var produktID = ""
    var body: some View {
        ZStack{
            Color("color2")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Deleteproduct")
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
                            TextField("ID produktu",text: $produktID)
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
                                self.API.deleteProduct(nazwa: nazwa, productID: produktID)}}, label: {
                                    roundedButton(text: "delete product")
                                        .padding()
                                })
                    Spacer()
                }
            }}}
}

struct DeleteProductView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteProductView()
    }
}
