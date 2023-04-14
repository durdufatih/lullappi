//
//  ItemListWhiteNoise.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 14.04.2023.
//

import SwiftUI

struct ItemListWhiteNoise: View {
    @EnvironmentObject var itemViewModel: ItemViewModel
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 150)), count: 2)
    }
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: items,spacing: 10) {
                ForEach(itemViewModel.whiteNoiseList) { item in
                    NavigationLink(destination: DetailView(item: item, icon: true)) {
                        Item(item: item,icon: true)
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle("Choose Lullaby" , displayMode:.inline)
            .navigationViewStyle(.stack)
        }
    }
}

struct ItemListWhiteNoise_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemListWhiteNoise()
        }.environmentObject(ItemViewModel())
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
        
    }
}
