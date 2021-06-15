//
//  EditPermissionsView.swift
//  shopDB
//
//  Created by iSero on 05/06/2021.
//

import SwiftUI

struct EditPermissionsView: View {
    @EnvironmentObject var API : NetworkManager
    @State private var userID = ""
    @State private var newStatus = ""
    var body: some View {
        ZStack{
            Color("color2")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Edit permissions")
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                    .foregroundColor(Color("color1"))
                Divider()
                VStack{
                    
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.white)
                        .overlay(
                            TextField("ID uzytkownika",text: self.$userID)
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
                            TextField("Nowy status",text: $newStatus)
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
                                self.API.changePermissions(user_id: self.userID, new_status: self.newStatus)}}, label: {
                                    roundedButton(text: "Change permmisions")
                                        .padding()
                                })
                    Spacer()
                }
            }}}

 }
struct EditPermissionsView_Previews: PreviewProvider {
    static var previews: some View {
        EditPermissionsView()
    }
}
