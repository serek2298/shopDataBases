//
//  SearchListView.swift
//  shopDB
//
//  Created by iSero on 05/06/2021.
//

import SwiftUI

struct SearchListView: View {
    @EnvironmentObject var API : NetworkManager
    var kategoria:Int
    var body: some View {
        List{
            ForEach(API.search){ item in
                NavigationLink(destination:ProductView(item: item)){
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
        }.onAppear(perform: {
            API.search.removeAll()
            API.szukaj(category: kategoria)
        })
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView( kategoria: 1)
    }
}
