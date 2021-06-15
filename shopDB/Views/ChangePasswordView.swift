//
//  ChangePasswordView.swift
//  shopDB
//
//  Created by iSero on 04/06/2021.
//

import SwiftUI

struct ChangePasswordView: View {
    @EnvironmentObject var API : NetworkManager

    @State var newPassword:String = ""
    @State var newPassword2:String = ""
    @State var oldPassword = ""
    var isComplete = false
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
                        TextField("New password",text: $newPassword)
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
                        TextField("Repeat new password",text: $newPassword2)
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
                        TextField("Old password",text: $oldPassword)
                            .cornerRadius(100)
                            .foregroundColor(Color("color4"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(minHeight:30)
                        
                    )
                    .frame(height: 50)
                    .padding(.horizontal)
                    .shadow(radius: 10)
                Button(action: changePassword){roundedButton(text: "Change!")}
                    .padding()
                Spacer()
            }
        }}
    }
    
    func changePassword(){
        print("change")
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}

