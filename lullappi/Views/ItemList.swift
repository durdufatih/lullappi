//
//  ItemList.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 16.02.2023.
//

import SwiftUI
import GoogleMobileAds

enum AdIds : String {
    
    case appId              = "ca-app-pub-6063592974982071~6379577063" // app id
    case banner             = "ca-app-pub-6063592974982071/6694517237" // test id
    //"ca-app-pub-3940256099942544/2934735716"
    case interstitial       = "ca-app-pub-6063592974982071/6612247445"
    //"ca-app-pub-3940256099942544/4411468910"
    
}

struct ItemList: View {
    
    @EnvironmentObject var itemViewModel: ItemViewModel
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 150)), count: 2)
    }
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: items,spacing: 10) {
                ForEach(itemViewModel.itemList) { item in
                    NavigationLink(destination: DetailView(item: item,icon:false)) {
                        Item(item: item,icon: false)
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle("Choose Lullaby" , displayMode:.inline)
            //.navigationBarItems(
                //leading:
                //    NavigationLink(destination: PremiumPage()){Image(systemName: "fuelpump.fill").foregroundColor(.white)},
                //trailing:
                //    NavigationLink(destination: Settings()){Image(systemName: "gear").foregroundColor(.white)}
            //)
            .navigationViewStyle(.stack)
            
        }
        //.background(
        //    Image("background")
        //        .resizable()
        //        .edgesIgnoringSafeArea(.all)
        //        .scaledToFill()
        //    )
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemList()
        }.environmentObject(ItemViewModel())
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
            
    }
}
