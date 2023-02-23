//
//  ItemModel.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 16.02.2023.
//

import Foundation


struct ItemModel:Identifiable{
    
    let id: String = UUID().uuidString
    let name: String
    let image: String
    let shownName: String
}
