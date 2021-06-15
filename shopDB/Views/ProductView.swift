//
//  ProductView.swift
//  shopDB
//
//  Created by iSero on 29/05/2021.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var API : NetworkManager
    var item: Produkt
    @State var amount = 1
    var body: some View {
        ZStack{
            Color("color2")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
            VStack{
                RemoteImage(url: item.zdjecie ?? "")
                    .aspectRatio(contentMode: .fit)
                    
                    
                Text(item.nazwa ?? "")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                HStack{
                    Spacer()
                Text("\(money(amount:item.brutto ?? 0))zl")
                    .font(.system(size: 20))
                Spacer()
                }.padding(.leading)
                    
                Text(item.opis ?? "")
                    .multilineTextAlignment(.center)
                    .padding()
                HStack{
                    HStack{
                        Button(action: {
                                  self.amount += 1
                               }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color("color1"))
                                .font(.system(size: 50))
                                .aspectRatio(contentMode: .fit)
                        }
                        Text("\(amount)")
                            .font(.system(size: 50))
                            .bold()
                        Button(action: {
                            if(self.amount>1){self.amount -= 1}
                            
                               }) {
                            Image(systemName: "minus.circle")
                                .foregroundColor(Color("color1"))
                                .font(.system(size: 50))
                                .aspectRatio(contentMode: .fit)
                               }
                    }
                    Spacer()
                    Button(action: {
                        DispatchQueue.main.async {
                            self.API.addToBasket(productID: item.id ?? "", amount: amount)}
                        
                           }) {
                        Image("cart")
                            .foregroundColor(Color("color1"))
                            .frame(height:100)
                            .font(.system(size: 50))
                            .aspectRatio(contentMode: .fit)
                    }
                    
                }.padding()
                .frame(height:100)
            }
        }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(item: Produkt(id: "ds", nazwa: "test", opis: "testowy opis wielolinijkowy zeby mozna bylo sprawdzic czy dobrze sie text zawija bo jak sie dorbze nie zawija to przypal", zdjecie: "brak", netto: 19.56, brutto: 20.56, podatek: 2, kategoria: 1))
    }
}
