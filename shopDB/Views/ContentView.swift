//
//  ContentView.swift
//  shopDB
//
//  Created by iSero on 23/05/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var API = NetworkManager()
    var body: some View {
        NavigationView{
            ZStack{
                Color("color3")
                    .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Image(systemName: "bag.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .foregroundColor(Color("color2"))
                    Text("ShopDB")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("color2"))
                        .padding()
                }
                Spacer()
                NavigationLink(destination: LoginView()){
                    roundedButton(text: "Login")
                }.padding(.horizontal)
                NavigationLink(destination: RegisterView()){
                    roundedButton(text: "Register")
                }.padding()
            }

            }

        }.environmentObject(API)
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

