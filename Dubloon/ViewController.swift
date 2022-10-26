import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MusicHelper.sharedHelper.playBackgroundMusic()
        // Do any additional setup after loading the view.
    }
    
    var player: AVAudioPlayer?
    
    @IBAction func viewRules(_ sender: UIButton) {
        let showRules = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "rulesVC") as! RulesViewController
        self.addChild(showRules)
        showRules.view.frame = self.view.frame
        self.view.addSubview(showRules.view)
        showRules.didMove(toParent: self)
        playSound(sound:"click", type:"wav")
        
    }
    
    
    @IBAction func showOppSelect(_ sender: UIButton) {
        let oppSelectVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "cpuSelection") as! OppSelectViewController
        self.addChild(oppSelectVC)
        oppSelectVC.view.frame = self.view.frame
        self.view.addSubview(oppSelectVC.view)
        oppSelectVC.didMove(toParent: self)
        playSound(sound:"click", type:"wav")
    }
    
    
    @IBAction func showSettings(_ sender: UIButton) {
        let settingsVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "settingsVC") as! SettingsViewController
        self.addChild(settingsVC)
        settingsVC.view.frame = self.view.frame
        self.view.addSubview(settingsVC.view)
        settingsVC.didMove(toParent: self)
        playSound(sound:"click", type:"wav")
    }
}

