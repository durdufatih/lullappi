//
//  PlayView.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 17.02.2023.
//

import SwiftUI
import AdSupport
import GoogleMobileAds
struct PlayView: View {
    
    @EnvironmentObject var viewModel:ItemViewModel
    @State var playAction:Bool = true
    @State var valueText:String = ""
    
    
    
    var body: some View {
        
        VStack{
            if (!(valueText.isEmpty) && !(valueText == "") && !(valueText == "00:00") && viewModel.timeLenght > 0){ Text(valueText).font(.title).fontWeight(.bold).foregroundColor(.primary)
                    .onReceive(viewModel.timer) { _ in
                        if viewModel.timeLenght > 0 {
                            viewModel.decreaseTimer()
                            valueText = viewModel.getTimerText()
                        }
                    }
            }
            
            HStack{
                Image(systemName: "timer.circle").resizable().frame(width: 50,height: 50)
                    .foregroundColor(.black).padding(10)
                    .onTapGesture(
                        perform: {
                            viewModel.increaseRangeIndex()
                            viewModel.resetCount()
                            valueText = viewModel.getTimerText()
                        }
                    )
                Image(systemName: playAction ? "pause.circle":"play.circle").resizable()
                    .frame(width: 70,height: 70).foregroundColor(.black).padding(10)
                    .onTapGesture(
                        perform: {
                            playAction.toggle()
                            viewModel.changePlay(result: playAction)
                        }
                    )
                Image(systemName: "repeat.circle").resizable()
                    .frame(width: 50,height: 50).foregroundColor(.black).padding(10)
                    .onTapGesture (perform: {
                        viewModel.increaseRepeatCount()
                        viewModel.resetTimerAll()
                        valueText = "\(viewModel.repeatCount) Times"
                    })
                    
                
                
            }
            //BannerVC()
        }.onAppear(){
            valueText = viewModel.getTimerText()
        }
        
        
        
        
    }
    
    
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        let valueText = "Hello"
        NavigationView{
            PlayView(valueText: valueText)
        }.environmentObject(ItemViewModel())
    }
}
