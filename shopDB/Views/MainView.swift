//
//  MainView.swift
//  shopDB
//
//  Created by iSero on 27/05/2021.
//

import SwiftUI
import FloatingTabBar

struct MainView: View {
    @EnvironmentObject var API : NetworkManager
    var body: some View {
        ZStack{
            
            Color("color4")
                .edgesIgnoringSafeArea(.all)
            
            List{
                ForEach(API.items){ item in
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
                DispatchQueue.main.async {
                    API.getMain()
                }
                
            })
        }
    }
    
    
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

func money(amount: Double) -> String{
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.minimumFractionDigits = 2
    numberFormatter.maximumFractionDigits = 2
    guard let number =  numberFormatter.string(from: NSNumber(value: amount))
    else {
        fatalError("Cannot get number")
        
    }
    
    return "\(number)"
}
