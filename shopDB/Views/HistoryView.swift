//
//  HistoryView.swift
//  shopDB
//
//  Created by iSero on 05/06/2021.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var API : NetworkManager
    var body: some View {
        Text("History View!")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
