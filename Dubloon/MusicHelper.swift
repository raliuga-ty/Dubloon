import Foundation
import AVFoundation

class MusicHelper {
static let sharedHelper = MusicHelper()
var audioPlayer: AVAudioPlayer?
    var index:Int=0
    
func playBackgroundMusic() {
    let bGMusicTrack1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "pirateJig1", ofType: "mp3")!)
    let bGMusicTrack2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Loot", ofType: "mp3")!)
    let bGMusicTrack3 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "waves", ofType: "mp3")!)
    
    do {
        switch index{
        case 0:
            audioPlayer = try AVAudioPlayer(contentsOf:bGMusicTrack1 as URL)
           // audioPlayer = try AVAudioPlayer(contentsOf:bGMusicTrack2 as URL)
        case 1:
            audioPlayer = try AVAudioPlayer(contentsOf:bGMusicTrack2 as URL)
           // audioPlayer = try AVAudioPlayer(contentsOf:bGMusicTrack3 as URL)
        default:
            audioPlayer = try AVAudioPlayer(contentsOf:bGMusicTrack3 as URL)
           // audioPlayer = try AVAudioPlayer(contentsOf:bGMusicTrack4 as URL)
            
        }
        audioPlayer!.numberOfLoops = -1
        audioPlayer!.prepareToPlay()
        audioPlayer!.play()
    }
    catch {
        print("Cannot play the file")
    }
}
    
    func playPauseBackgroundMusic(){
        if !audioPlayer!.isPlaying{
            audioPlayer!.play()
        }
        else{
            audioPlayer!.stop()
        }
    }
    
    func nextTrack(){
        if self.index > 1 {
            self.index = 0
        }
        else{
            self.index = self.index + 1
        }
        playBackgroundMusic()
    }
    
    func prevTrack(){
        if self.index < 1 {
            self.index = 2
    }
        else{
            self.index = self.index - 1
        }
        playBackgroundMusic()
    }
}
