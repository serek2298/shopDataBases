//
//  OrderView.swift
//  shopDB
//
//  Created by iSero on 05/06/2021.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var API : NetworkManager
    var body: some View {
        ScrollView{
            VStack{
                List{
                    ForEach(API.items){ item in
                        HStack{
                            RemoteImage(url: item.zdjecie ?? "")
                                .aspectRatio(contentMode: .fit)
                                .frame(height:100)
                            
                            Spacer()
                            VStack{
                                Text(item.nazwa ?? "")
                                    .bold()
                                    .font(.system(size: 20))
                                    .multilineTextAlignment(.trailing)
                                Spacer()
                                Text("\(money(amount: item.brutto ?? 0))zl")
                            }
                        }.padding()
                    }
                }
                Divider()
                Text("Dane adresowe")
                    .font(.system(size: 30))
                    .foregroundColor(Color("color4"))
                roundedButton(text: self.API.user.ulica ?? "Uzupelnij dane adresowe")
                    .foregroundColor(Color("color4"))
                    .padding(.horizontal)
                roundedButton(text: "\(self.API.user.numerbudynku ?? 404)" )
                    .foregroundColor(Color("color4"))
                    .padding(.horizontal)
                roundedButton(text: "\(self.API.user.numermieszkania ?? 404)")
                    .foregroundColor(Color("color4"))
                    .padding(.horizontal)
                roundedButton(text: self.API.user.kodpocztowy ?? "Uzupelnij dane adresowe")
                    .foregroundColor(Color("color4"))
                    .padding(.horizontal)
                roundedButton(text: self.API.user.miasto ?? "Uzupelnij dane adresowe")
                    .foregroundColor(Color("color4"))
                    .padding(.horizontal)
                Button(action: {
                        self.API.buy()
                }, label: {
                    roundedButton(text: "Finish transaction")
                        .padding(.all)
                })
            }}
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
