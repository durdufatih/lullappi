//
//  BannerRepresentable.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 21.02.2023.
//

import Foundation
import GoogleMobileAds
import UIKit
import SwiftUI

 public struct BannerVC: UIViewControllerRepresentable  {

    public func makeUIViewController(context: Context) -> UIViewController {
        let gadSize = GADAdSize(size: CGSize.init(width: UIScreen.main.bounds.width, height: 50), flags: 1)
        let view = GADBannerView(adSize: gadSize)

        let viewController = UIViewController()
        view.adUnitID = AdIds.banner.rawValue
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: gadSize.size)
        view.load(GADRequest())

        return viewController
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
