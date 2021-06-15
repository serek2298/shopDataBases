//
//  BasketView.swift
//  shopDB
//
//  Created by iSero on 02/06/2021.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var API :NetworkManager
    var total:Double{
        var temp:Double = 0.0
        for item in API.koszyk{
            if let  price = item.brutto{
                temp += price * Double(item.ilosc!)
            }
        }
        return temp
    }
    var body: some View {
        VStack{
            Text("Basket")
                .bold()
                .font(.system(size: 30))
        List{
            ForEach(API.koszyk){ item in
                NavigationLink(destination:ProductView(item: item)){
                    HStack{
                        if let url = item.zdjecie{
                        RemoteImage(url: url)
                            .aspectRatio(contentMode: .fit)
                            .frame(height:100)
                        }
                        Spacer()
                        VStack{
                            Text(item.nazwa ?? "Loading...")
                                .bold()
                                .font(.system(size: 20))
                                .multilineTextAlignment(.trailing)
                            Spacer()
                            
                            Text("\(item.ilosc ?? 0)")
                            Spacer()
                            Text("\(money(amount: item.brutto ?? 0))zl")
                        }
                    }.padding()
                    
                    
                }
            }.onDelete(perform: deleteFromBasket)
        }.onAppear(perform: {
                API.getBasket(email: API.user.email, password: API.user.haslo)
                API.getAddress()
            
        })
        .navigationTitle("Basket")
        .background(Color("color2"))
        NavigationLink(
            destination: OrderView(),
            label: {
                roundedButton(text: "BUY")
                    .foregroundColor(Color("color4"))
                    .padding()
            })
            HStack{
                Spacer()
                Text("Total: \(money(amount: total))")
                    .bold()
                    .font(.system(size: 30))
                Spacer()
            }
        }
    }
    
    func deleteFromBasket(at offsets: IndexSet){
        let index = offsets[offsets.startIndex]
        if let id = self.API.koszyk[index].id{
            self.API.removeFromBasket(productID: id )
        }
        
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
