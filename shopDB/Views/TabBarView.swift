//
//  TabBarView.swift
//  shopDB
//
//  Created by iSero on 05/06/2021.
//

import SwiftUI
import FloatingTabBar

struct TabBarView: View {
    
    @State public var selectedIndex: Int = 0
    
    var viewList = [AnyView]()
    var body: some View {
        TabView(selection: $selectedIndex,
                content: {
                    MainView()
                        .tabItem { Label(
                            title: { Text("Home") },
                            icon: { Image(systemName: "house") })}
                    SearchView()
                        .tabItem { Label(
                            title: { Text("Search") },
                            icon: { Image(systemName: "magnifyingglass") }) }
                    BasketView()
                        .tabItem { Label(
                            title: { Text("Basket") },
                            icon: { Image(systemName: "cart.fill") })}
                    SettingsView()
                        .tabItem { Label(
                            title: { Text("Settings") },
                            icon: { Image(systemName: "person.crop.circle.fill") }) }
                    
                })
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
