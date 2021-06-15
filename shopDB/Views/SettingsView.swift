//
//  SettingsView.swift
//  shopDB
//
//  Created by iSero on 04/06/2021.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var API : NetworkManager

    var body: some View {
        VStack{
            Text("Account settings")
                .bold()
                .font(.system(size: 30))
            List{
                NavigationLink(
                    destination: ChangePasswordView(),
                    label: {
                        HStack{
                            Spacer()
                            Text("Change password")
                            Spacer()
                        }
                        
                            
                    }).padding()
                NavigationLink(
                    destination: ChangeEmailView(),
                    label: {
                        HStack{
                            Spacer()
                            Text("Change email")
                            Spacer()
                        }
                        
                            
                    }).padding()
                NavigationLink(
                    destination: ChangeDataView(),
                    label: {
                        HStack{
                            Spacer()
                            Text("Change address")
                            Spacer()
                        }
                        
                            
                    }).padding()
                NavigationLink(
                    destination: HistoryView(),
                    label: {
                        HStack{
                            Spacer()
                            Text("History of transactions")
                            Spacer()
                        }
                        
                            
                    }).padding()
                if(API.user.statuskonta == 1){
                    NavigationLink(
                        destination: AddProductView(),
                        label: {
                            HStack{
                                Spacer()
                                Text("Add produkt")
                                Spacer()
                            }
                            
                                
                        }).padding()
                    NavigationLink(
                        destination: DeleteProductView(),
                        label: {
                            HStack{
                                Spacer()
                                Text("Delete product")
                                Spacer()
                            }
                            
                                
                        }).padding()
                    NavigationLink(
                        destination: ModifyProduktView(),
                        label: {
                            HStack{
                                Spacer()
                                Text("Modify product")
                                Spacer()
                            }
                            
                                
                        }).padding()
                    NavigationLink(
                        destination: EditPermissionsView(),
                        label: {
                            HStack{
                                Spacer()
                                Text("Edit permissions")
                                Spacer()
                            }
                            
                                
                        }).padding()
                }
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
