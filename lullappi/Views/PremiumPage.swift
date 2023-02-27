//
//  PremiumPAge.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 22.02.2023.
//

import SwiftUI

struct PremiumPage: View {

    var body: some View {
        
       
        VStack{
            Text("Sell Your Time").font(.title).fontWeight(.bold).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            Text("Dont see ads and save your free time").padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            VStack{
                Text("Hello")
                Spacer()
               Button("9.99$ / 1 Month") {
                   print("Test")
                }.frame(maxWidth: .infinity,minHeight: 45).background(Color.blue).controlSize(.large).foregroundColor(.white).cornerRadius(10)
                
                Button("96.00$ / 12 Month") {
                    print("Buy items 9.99")
                }.frame(maxWidth: .infinity,minHeight: 45).background(Color.blue).controlSize(.large).foregroundColor(.white).cornerRadius(10)
                Text("Save %20 from yearly sell").foregroundColor(.purple).font(Font.caption).fontWeight(.bold)
            }.padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            
        }.foregroundColor(.yellow)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            )
    }
}

struct PremiumPage_Previews: PreviewProvider {
    static var previews: some View {
        PremiumPage()
    }
}
