//
//  roundedButton.swift
//  shopDB
//
//  Created by iSero on 23/05/2021.
//

import Foundation
import SwiftUI

struct roundedButton: View{
    let text:String
    var body: some View{
        ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color("color2"))
                    .shadow(radius: 10)
                    .frame(height: 50)
                    .overlay(Text(text).font(.system(size: 30))
                                .bold()
                                .foregroundColor(Color("color1")))
                
            
        }
    }
}
