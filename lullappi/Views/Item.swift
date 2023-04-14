//
//  Item.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 16.02.2023.
//

import SwiftUI

struct Item: View {
    
    var item:ItemModel
    var icon:Bool
    var body: some View {
        VStack{
            if icon{Image(systemName: item.image).resizable().frame(width: 60,height: 60)
                    .scaledToFit().cornerRadius(15).foregroundColor(.white)
            }else{
                Image(item.image).resizable().frame(width: 175,height: 125).scaledToFit().cornerRadius(15)
            }
            Text(item.shownName).fontWeight(.semibold).foregroundColor(.white)
        }.frame(width: 160,height: 150).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        .background(Color(.systemPurple))
        .cornerRadius(15)
        
    }
}

struct Item_Previews: PreviewProvider {
    
    static var testItem = ItemModel(name: "baa-baa-black-sheep", image: "cartoon1", shownName: "Ba Black Sheep")
    static var previews: some View {
        Item(item: testItem,icon:false)
    }
}
