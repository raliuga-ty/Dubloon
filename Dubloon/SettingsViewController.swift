import UIKit
import AVFoundation

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.view.removeFromSuperview()
        playSound(sound:"click", type:"wav")
    }
    
    @IBAction func playPause(_ sender: UIButton) {
        MusicHelper.sharedHelper.playPauseBackgroundMusic()
        playSound(sound:"click", type:"wav")
    }
    
    @IBAction func nextTrack(_ sender: UIButton) {
        MusicHelper.sharedHelper.nextTrack()
        playSound(sound:"click", type:"wav")
    }
    
    @IBAction func prevTrack(_ sender: UIButton) {
        MusicHelper.sharedHelper.prevTrack()
        playSound(sound:"click", type:"wav")
    }
}
