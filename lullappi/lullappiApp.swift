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
       
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.setAnimationsEnabled(false)
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "F8BB1C28-BAE8-11D6-9C31-00039315CD46" ]
        
                   
               
    }
    
    @StateObject var itemViewModel : ItemViewModel = ItemViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                ItemList()
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
