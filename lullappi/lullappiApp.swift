//
//  lullappiApp.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 16.02.2023.
//

import SwiftUI
import AppTrackingTransparency
import GoogleMobileAds

@main
struct lullappiApp: App {
    
    init() {
       
        DispatchQueue.main.async {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().tintColor = UIColor.white
            UINavigationBar.setAnimationsEnabled(false)
            GADMobileAds.sharedInstance().start(completionHandler: nil)
            GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "F8BB1C28-BAE8-11D6-9C31-00039315CD46" ,"74e40c4a1fd65ccfb362d68b3a9a1388"]
        }
        
        
                   
               
    }
    
    @StateObject var itemViewModel : ItemViewModel = ItemViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                TabView {
                    ItemList()
                                .tabItem {
                                    Image(systemName: "1.circle")
                                    Text("Lullabies")
                                }
                    ItemListWhiteNoise()
                                .tabItem {
                                    Image(systemName: "2.circle")
                                    Text("Noises")
                                }
                }.background(.red)
                
            }.environmentObject(itemViewModel)
                .navigationViewStyle(.stack)
                .edgesIgnoringSafeArea(.all)
                .background(
                    Image("background")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                    )
        }
    }
}
