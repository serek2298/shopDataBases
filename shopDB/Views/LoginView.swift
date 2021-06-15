//
//  LoginView.swift
//  shopDB
//
//  Created by iSero on 23/05/2021.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @EnvironmentObject var API : NetworkManager
    @State private var email = "mirek@gmail.com"
    @State private var password = "abcd"
   
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
                    
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.white)
                        .overlay(
                            TextField("Enter email",text:$email)
                                .cornerRadius(100)
                                .foregroundColor(Color("color4"))
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .frame(minHeight:30)
                            
                        )
                        .frame(height: 50)
                        .padding(.horizontal)
                    
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.white)
                        .overlay(
                            SecureField("Enter password",text:$password)
                                .cornerRadius(100)
                                .foregroundColor(Color("color4"))
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .frame(minHeight:30,alignment: .center)
                        )
                        .frame(height:50)
                        .padding()
                    
                    NavigationLink(
                        destination: TabBarView(),
                        isActive: self.$API.isLogged,
                        label: {
                            EmptyView()
                        })
                    Button{
                        API.login(email: email, password: password)
                    }label: {
                        roundedButton(text: "Login")
                            .foregroundColor(Color("color4"))
                    }
                    Spacer()
                }
                
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


