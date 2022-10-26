import UIKit

class OppSelectViewController: UIViewController {

    @IBOutlet weak var ladyPirate: UIImageView!
    @IBOutlet weak var octoPirate: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var counter: UIStepper!
    @IBAction func oppCount(_ sender: UIStepper) {
        print(sender.value)
        playSound(sound:"click", type:"wav")
        
        switch sender.value{
        case 2:
            ladyPirate.isHidden = false
            octoPirate.isHidden = true
        case 3:
            octoPirate.isHidden = false
        default:
            ladyPirate.isHidden = true
        }
    }
    
    @IBAction func showGame(_ sender: UIButton) {
        let gameVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "gameSceneVC") as! GameViewController
        self.addChild(gameVC)
        gameVC.view.frame = self.view.frame
        self.view.addSubview(gameVC.view)
        gameVC.didMove(toParent: self)
        
        gameVC.makePlayerList(number: Int(counter.value))
        playSound(sound:"click", type:"wav")
    }
}
