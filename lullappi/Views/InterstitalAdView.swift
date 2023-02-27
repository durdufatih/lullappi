//
//  InterstitalAdView.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 21.02.2023.
//

import Foundation

import GoogleMobileAds
import UIKit


final class Interstitial: NSObject, GADFullScreenContentDelegate {
    private var interstitial: GADInterstitialAd?
    
    override init() {
        super.init()
    }

    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
    
    func showAd(){
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:AdIds.interstitial.rawValue,request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
              print("Failed to load interstitial ad: \(error.localizedDescription)")
              return
            }
            self.interstitial = ad
            self.interstitial?.fullScreenContentDelegate = self
                if ad != nil{
                    let root = UIApplication.shared.windows.first?.rootViewController
                    self.interstitial?.present(fromRootViewController: root!)
                }
                else{
                    print("Ad wasn't ready")
                }
            }
        )
    
        
    }
}
