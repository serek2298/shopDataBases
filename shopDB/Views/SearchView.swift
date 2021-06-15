//
//  SearchView.swift
//  shopDB
//
//  Created by iSero on 05/06/2021.
//

import SwiftUI

struct SearchView: View {

    @EnvironmentObject var API : NetworkManager
    var body: some View {
        VStack{
            Text("Szukaj:")
                .font(.system(size: 40))
                .bold()
        List{
            NavigationLink(
                destination: SearchListView(kategoria: 1),
                label: {
                    Text("Procesory")
                })
            
            NavigationLink(
                destination: SearchListView(kategoria: 2),
                label: {
                    Text("Karty graficzne")
                })
            NavigationLink(
                destination: SearchListView(kategoria: 3),
                label: {
                    Text("Obudowy do PC")
                })
            NavigationLink(
                destination: SearchListView(kategoria: 4),
                label: {
                    Text("Dyski twarde")
                })
            NavigationLink(
                destination: SearchListView(kategoria: 5),
                label: {
                    Text("Karty sieciowe")
                })
        }.font(.system(size: 30))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
