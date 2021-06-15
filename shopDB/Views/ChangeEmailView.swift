//
//  ChangeEmailView.swift
//  shopDB
//
//  Created by iSero on 04/06/2021.
//

import SwiftUI

struct ChangeEmailView: View {
    @EnvironmentObject var API : NetworkManager

    @State var newEmail:String = ""
    @State var newEmail2:String = ""
    @State var oldPassword = ""
    var isComplete = false
    var body: some View {
        ZStack{
            Color("color2")
                .edgesIgnoringSafeArea(.all)
        VStack{
        Text("Change Email")
            .bold()
            .font(.system(size: 30))
            .padding()
            .foregroundColor(Color("color1"))
            Divider()
            VStack{
               
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.white)
                    .overlay(
                        TextField("New email",text: $newEmail)
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
                        TextField("Repeat new email",text: $newEmail2)
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
                        TextField("Password",text: $oldPassword)
                            .cornerRadius(100)
                            .foregroundColor(Color("color4"))
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .frame(minHeight:30)
                        
                    )
                    .frame(height: 50)
                    .padding(.horizontal)
                    .shadow(radius: 10)
                Button(action: changeEmail){roundedButton(text: "Change!")}
                    .padding()
                Spacer()
            }
        }}
    }
    func changeEmail(){
        print("change")
    }
}

struct ChangeEmailView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeEmailView()
    }
}
