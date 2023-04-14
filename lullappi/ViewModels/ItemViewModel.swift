//
//  ItemViewModel.swift
//  lullappi
//
//  Created by Mehmet Fatih Durdu on 17.02.2023.
//

import Foundation
import AVFAudio

public class ItemViewModel : ObservableObject {
    
    @Published var itemList : [ItemModel] = [
        ItemModel(name: "baa-baa-black-sheep.mp4", image: "cartoon1", shownName: "Ba Black Sheep"),
        ItemModel(name: "Baby-lullaby-music.mp4", image: "cartoon5", shownName: "Baby Lullaby Music"),
        ItemModel(name: "hush-little-baby.mp4", image: "cartoon6", shownName: "Hush Little Baby"),
        ItemModel(name: "lavenders-blue.mp4", image: "cartoon1", shownName: "Lavenders"),
        ItemModel(name: "mozart-minuet.mp4", image: "cartoon5", shownName: "Mozart Minuet"),
        ItemModel(name: "mozart-piano-Sonata.mp4", image: "cartoon6", shownName: "Mozart Piano Sonata"),
        ItemModel(name: "mozart-serenade.mp4", image: "cartoon1", shownName: "Mozart Serenade"),
        ItemModel(name: "twinkle-twinkle-little-star.mp4", image: "cartoon5", shownName: "Twinkle Little Star"),
    ]
    
    @Published var whiteNoiseList : [ItemModel] = [
        ItemModel(name: "babydriving.mp3", image: "car", shownName: "Driving"),
        ItemModel(name: "clothesdryer.mp3", image: "dryer", shownName: "Clothes Dryer"),
        ItemModel(name: "drone.mp3", image: "airplane", shownName: "Drone"),
        ItemModel(name: "fetalhearth.mp3", image: "heart", shownName: "Heart"),
        ItemModel(name: "freeway.mp3", image: "road.lanes", shownName: "Free Way"),
        ItemModel(name: "hairdryer.mp3", image: "dryer", shownName: "Hear Dryer"),
        ItemModel(name: "pinknoise.mp3", image: "crown", shownName: "Pink Noise"),
        ItemModel(name: "shower.mp3", image: "shower", shownName: "Shower"),
        ItemModel(name: "vacuum.mp3", image: "wind", shownName: "Vacuum"),
        ItemModel(name: "whitenoise.mp3", image: "crown", shownName: "White Noise"),
    ]
    
    public var player: AVAudioPlayer?
    public var play:Bool = true
    public var rangeOfTime = [0.0,300.0,600.0,900.0,1200.0,1500.0,1800.0,2100.0,2400.0,2700.0,3000.0]
    public var rangeIndex = 0
    public var repeatCount = 0
    public var timeLenght = 0.0
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public func startPlayer(pathString:String){
        
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let sessionErr{
            print ("Session setting problem :\(sessionErr)")
        }
        guard let path = Bundle.main.path(forResource: pathString,ofType: nil) else {
            debugPrint("\(pathString) not found")
            return
        }
        

        player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        player!.numberOfLoops = 0
        player!.play()
        timeLenght = getRangeByIndex()
    }
    
    public func increaseRepeatCount(){
        repeatCount += 1
        player?.numberOfLoops = repeatCount
        self.timer.upstream.connect().cancel()
        timeLenght = 0.0
        
    }
    
    public func resetTimerAll(){
        timeLenght = 0.0
        rangeIndex = 0
        timer.upstream.connect().cancel()
        
    }
    
    public func resetCount(){
        repeatCount = 0
        player?.numberOfLoops = 0
    }
    
    public func getRangeByIndex()-> Double{
        return rangeOfTime[rangeIndex]
    }
    
    public func increaseRangeIndex(){
       
        if rangeIndex + 1 == 10 {
            rangeIndex=0
        }
        else{
            rangeIndex = rangeIndex+1
        }
        
        if !playerPlayingCheck(){
            player?.play()
        }
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        timeLenght = getRangeByIndex()
        
    }
    public func getTimerText() -> String{
        let minutes = (timeLenght / 60).rounded(.down)
        let seconds = timeLenght.truncatingRemainder(dividingBy: 60).rounded()
        return String(format: "%02.f:%02.f", minutes,seconds)
    }
    
    
    public func playerPlayingCheck() -> Bool {
        return player!.isPlaying && player!.duration != 0
    }
    
    public func changePlay(result:Bool){
        if result {
            //if playerPlayingCheck() {
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                player!.play()
            //}
        }
        else{
            player?.stop()
            self.timer.upstream.connect().cancel()
        }
        play = result
    }
    
    public func decreaseTimer(){
        timeLenght = timeLenght-1
        if timeLenght != 0 && !playerPlayingCheck(){
            player?.play()
        }
        
        if timeLenght == 0 {
            player?.stop()
            self.timer.upstream.connect().cancel()
            rangeIndex = 0
        }
    }
    
    
    
    
}
