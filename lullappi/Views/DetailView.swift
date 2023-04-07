//
//  DetailView.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 17.02.2023.
//

import SwiftUI

struct DetailView: View {
    @State var firstAppear: Bool = true
    var item:ItemModel
    @EnvironmentObject var viewModel:ItemViewModel
    
    var body: some View {
        
        ZStack{
            VStack{
               Spacer()
                HStack{
                    PlayView()
                }.frame(width: UIScreen.main.bounds.width).frame(height: 100)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 75, trailing: 0))
        }
        .background(
            Image(item.image)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill().opacity(0.8)
        ).navigationTitle(Text(item.shownName))
            //.onDisappear(perform:{
                //Interstitial().showAd()
            //})
            
            //.onAppear(perform: start)
            .onAppear(perform: {
                viewModel.resetCount()
                viewModel.resetTimerAll()
                if self.firstAppear {
                    //Interstitial().showAd()
                    start()
                    self.firstAppear = false
                }
                
            })
        
        
    }
    
    private func start(){
        viewModel.startPlayer(pathString: item.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var testItem = ItemModel(name: "baa-baa-black-sheep", image: "cartoon1", shownName: "Ba Black Sheep")
    static var previews: some View {
        NavigationView{
            DetailView(item: testItem)
        }.environmentObject(ItemViewModel()).navigationViewStyle(.stack)
    }
}
