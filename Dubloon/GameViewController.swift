import UIKit

struct Dice{
    var chosen : Bool
    var face : Int
    }//end Dice

class Player{
    var qual : Bool
    var tray : Array<Int>
    var score : Int
    var icon = #imageLiteral(resourceName: "Man")
    var name = String()
        
    init(qual : Bool, tray : Array<Int>, score : Int, name : String){
        self.qual = qual
        self.tray = tray
        self.score = score
        }//end init
    }//end Player
        
class CPU_Player : Player {
        var rolls = [0, 0, 0, 0, 0, 0]
        init(){
            super.init(qual : false, tray: [], score: 0, name : "")
        }
    }//end Player

class GameViewController: UIViewController {
    
    //Possible Dice faces
    let faces  = [ #imageLiteral(resourceName: "8_1"), #imageLiteral(resourceName: "8_2"), #imageLiteral(resourceName: "8_3"), #imageLiteral(resourceName: "8_4"), #imageLiteral(resourceName: "8_5"), #imageLiteral(resourceName: "8_6")]
    
    //let haptics = UINotificationFeedbackGenerator()
    let impactHaptics = UIImpactFeedbackGenerator()
    
    //Using an imageLiteral to map to its corresponding value
    public var values = [ #imageLiteral(resourceName: "8_1") : 1, #imageLiteral(resourceName: "8_2") : 2, #imageLiteral(resourceName: "8_3") : 3, #imageLiteral(resourceName: "8_4") : 4, #imageLiteral(resourceName: "8_5") : 5, #imageLiteral(resourceName: "8_6") : 6]
    
    //Using a numeric value to map to its corresponding value
    public var redVal = [1 : #imageLiteral(resourceName: "3_1"), 2 : #imageLiteral(resourceName: "3_2"), 3 : #imageLiteral(resourceName: "3_3"), 4 : #imageLiteral(resourceName: "3_4"), 5 : #imageLiteral(resourceName: "3_5"), 6 : #imageLiteral(resourceName: "3_6")]
    
    public var paulVal = [1 : #imageLiteral(resourceName: "2_1"), 2 : #imageLiteral(resourceName: "2_2"), 3 : #imageLiteral(resourceName: "2_3"), 4 : #imageLiteral(resourceName: "2_4"), 5 : #imageLiteral(resourceName: "2_5"), 6 : #imageLiteral(resourceName: "2_6")]
    
    public var anneVal = [1 : #imageLiteral(resourceName: "7_1"), 2 : #imageLiteral(resourceName: "7_2"), 3 : #imageLiteral(resourceName: "7_3"), 4 : #imageLiteral(resourceName: "7_4"), 5 : #imageLiteral(resourceName: "7_5"), 6 : #imageLiteral(resourceName: "7_6")]
    
    public var icons = [0 : #imageLiteral(resourceName: "Man"), 1 : #imageLiteral(resourceName: "manIcon"), 2 : #imageLiteral(resourceName: "ladyIcon"), 3: #imageLiteral(resourceName: "octoIcon")]
    
    public var names = [1 : "red", 2 : "anne", 3: "paul"]
    
    public var diceButtons = [1 : UIButton(), 2 : UIButton(), 3 : UIButton(), 4 : UIButton(), 5 : UIButton(), 6 : UIButton()]
    
    var diceChosen : [String] = []
    
    //declare iv
    let iv : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "spin1.png")
        iv.isUserInteractionEnabled = true
        return iv
        }()
    
    //declare array of images for animation
    var sprite = [UIImage]()
    
    //Declaring all possible CPUs
    let red = CPU_Player()
    let anneBonny = CPU_Player()
    let paul = CPU_Player()
    
    //Declaring localPlayer
    let localPlayer = Player(qual : false, tray: [], score: 0, name : "")
    
    //Declare array to be filled with players
    var totalPlayers : [Player] = []
    
    var computerPlayers : [CPU_Player] = []
    
    //Declare first time through bool
    var first = true
    
    //var keptDice = false
    
    //red's dice
    @IBOutlet weak var top_1: UIImageView!
    @IBOutlet weak var top_2: UIImageView!
    @IBOutlet weak var top_3: UIImageView!
    @IBOutlet weak var top_4: UIImageView!
    @IBOutlet weak var top_5: UIImageView!
    @IBOutlet weak var top_6: UIImageView!
    
    //paul's dice
    @IBOutlet weak var right_1: UIImageView!
    @IBOutlet weak var right_2: UIImageView!
    @IBOutlet weak var right_3: UIImageView!
    @IBOutlet weak var right_4: UIImageView!
    @IBOutlet weak var right_5: UIImageView!
    @IBOutlet weak var right_6: UIImageView!
    
    //paul's face and board
    @IBOutlet weak var ink_face: UIImageView!
    @IBOutlet weak var ink_board: UIImageView!
    
    //anne's dice
    @IBOutlet weak var left_1: UIImageView!
    @IBOutlet weak var left_2: UIImageView!
    @IBOutlet weak var left_3: UIImageView!
    @IBOutlet weak var left_4: UIImageView!
    @IBOutlet weak var left_5: UIImageView!
    @IBOutlet weak var left_6: UIImageView!
    
    //anne's face and board
    @IBOutlet weak var left_7: UIImageView!
    @IBOutlet weak var left_8: UIImageView!
    
    //Game view icon declarations
    @IBOutlet weak var keepButton: UIButton!
    @IBOutlet weak var keepPic: UIImageView!
    
    //Buttons on the top of the game screen
    @IBOutlet weak var diceButton1: UIButton!
    @IBOutlet weak var diceButton2: UIButton!
    @IBOutlet weak var diceButton3: UIButton!
    @IBOutlet weak var diceButton4: UIButton!
    @IBOutlet weak var diceButton5: UIButton!
    @IBOutlet weak var diceButton6: UIButton!
    

    var rollsDice : [UIButton] = []
    
    //Dice views corresponding to the buttons above
    @IBOutlet weak var diceViewTL: UIImageView!
    @IBOutlet weak var diceViewTM: UIImageView!
    @IBOutlet weak var diceViewTR: UIImageView!
    @IBOutlet weak var diceViewLL: UIImageView!
    @IBOutlet weak var diceViewLM: UIImageView!
    @IBOutlet weak var diceViewLR: UIImageView!
    
    //Dice views in the player's tray
    @IBOutlet weak var trayViewTL: UIImageView!
    @IBOutlet weak var trayViewTM: UIImageView!
    @IBOutlet weak var trayViewTR: UIImageView!
    @IBOutlet weak var trayViewLL: UIImageView!
    @IBOutlet weak var trayViewLM: UIImageView!
    @IBOutlet weak var trayViewLR: UIImageView!
    
    //View that contains the tray dice
    var trayDice : [UIImageView] = []
    
    @IBOutlet weak var rollButton: UIButton!
    
    //Keep button saves the dice in Tray and calls the roll function
    @IBAction func keepDice(_ sender: UIButton) {
        impactHaptics.prepare()
        impactHaptics.impactOccurred(intensity: 2.0)
        
        sender.isHidden = true
        keepPic.isHidden = true
        //keptDice = true
        playSound(sound:"Shake", type:"wav")
        
        let selectedDice = sender.titleLabel?.text
        
        for i in rollsDice{
            i.isHidden = true
        }
        roundManager()
        
        var count = 0
        
        for x in trayDice{
            if let y = x as? UIImageView{
                if y.isHidden == true{
                    rollsDice[count].isHidden = false
                }
            }
            count += 1
        }
        roll()
    } //end keepDice
        
//Updates the images and places rolled dice into the localPlayer's tray
    @IBAction func diceSelected(_ sender: UIButton) {
        //concatenate strings to have diceView and trayView speak to each other
        
        impactHaptics.prepare()
        impactHaptics.impactOccurred(intensity: 2.0)
        
        let position = sender.titleLabel!.text!
        
        keepButton.isHidden = false
        keepPic.isHidden = false
        
        switch position {
        case "TL":
            trayViewTL.image = diceViewTL.image
            trayViewTL.isHidden = false
            diceViewTL.isHidden=true
            sender.isHidden = true
            localPlayer.tray.append(values[trayViewTL.image!]!)
            
        case "TM":
            trayViewTM.image = diceViewTM.image
            trayViewTM.isHidden = false
            diceViewTM.isHidden=true
            sender.isHidden = true
            localPlayer.tray.append(values[trayViewTM.image!]!)
            
        case "TR":
            trayViewTR.image = diceViewTR.image
            trayViewTR.isHidden = false
            diceViewTR.isHidden=true
            sender.isHidden = true
            localPlayer.tray.append(values[trayViewTR.image!]!)
            
        case "LL":
            trayViewLL.image = diceViewLL.image
            trayViewLL.isHidden = false
            diceViewLL.isHidden=true
            sender.isHidden = true
            localPlayer.tray.append(values[trayViewLL.image!]!)
            
        case "LM":
            trayViewLM.image = diceViewLM.image
            trayViewLM.isHidden = false
            diceViewLM.isHidden=true
            sender.isHidden = true
            localPlayer.tray.append(values[trayViewLM.image!]!)
            
        case "LR":
            trayViewLR.image = diceViewLR.image
            trayViewLR.isHidden = false
            diceViewLR.isHidden=true
            sender.isHidden = true
            // print(values[trayViewLR.image!]!)
            localPlayer.tray.append(values[trayViewLR.image!]!)
            // print(trayValues)
            
        default:
            print("error")
        }//end switch statement
        
        if localPlayer.tray.count == 6{
            print("all done")
            roundManager()
            keepPic.isHidden = true
            keepButton.isHidden = true
            finalTurns()
        }
    }//end diceSelected
        
    func qualifiedPlayer(player : Player){
        if player.tray.contains(1) && player.tray.contains(4){
            player.qual = true
        }
    } //end qualifiedPlayer
        
    func sumScore(player : Player){
        
        if player.qual == true{
            print(player.qual.description)
            var sum = 0
            player.tray.forEach({ sum += $0})
            sum -= 5
            player.score = sum
        }//end if
        else {
            print(player.qual.description)
            player.score = 0
        }//end else
        return
    }//end sumScore
        
    func roundManager(){
        if first == true{
            first = false
        }
        print(totalPlayers)
        
        if localPlayer.tray.count != 6{
            print("Player turn")
        }
        
        for player in totalPlayers{
            if let cpuPlayer = player as? CPU_Player{
                print("CPU turn")
                // CPU rolls
                if cpuPlayer.tray.count != 6{
                    cpuRoll(bot: cpuPlayer)
                }
                else{
                    continue;
                }
            } //end if
        } //end for
        
        for x in totalPlayers{
            if let player = x as? Player{
                qualifiedPlayer(player: player.self)
            }
        }//end for
        
        for x in totalPlayers{
            if let player = x as? Player{
                sumScore(player: player.self)
                print(player.score)
            }
        }
    } //end roundManager
        
    func finalTurns(){
        print("in method")
        for player in totalPlayers{
            if let bot = player as? CPU_Player{
                while bot.tray.count != 6{
                    if let cpuPlayer = player as? CPU_Player{
                        print("CPU turn")
                        // CPU rolls
                        if cpuPlayer.tray.count != 6{
                            cpuRoll(bot: cpuPlayer)
                        }//end if
                        else{
                            continue
                        } //end else
                    } //end if let
                } //end while
            } //end if
        } //end for
        prepareButton()
        roundManager()
    }
        
    func roll(){
        //Remove the keep button
        keepButton.isHidden = true
        keepPic.isHidden = true
        
        //Assign dice faces to each image view left
        diceViewTL.image = faces.randomElement()
        diceViewTM.image = faces.randomElement()
        diceViewTR.image = faces.randomElement()
        diceViewLL.image = faces.randomElement()
        diceViewLM.image = faces.randomElement()
        diceViewLR.image = faces.randomElement()
    } //end roll
        
    func cpuRoll(bot : CPU_Player){
        print("CPU rolling")
        
        for i in 0...bot.rolls.count-1{
            bot.rolls[i] = Int.random(in: 1...6)
        }
        
        print(bot.rolls)
        print(bot.rolls.count.description + " dice are being rolled")
        
        cpuKeep(bot: bot)
    } //end cpuRoll
        
    func cpuKeep(bot : CPU_Player){
        
        var removal = 0
        
        for i in 0...bot.rolls.count-1{
            switch bot.rolls[i]{
            case 1:
                if bot.tray.contains(1)==false && bot.rolls[i]==1{
                    bot.tray.append(bot.rolls[i])
                    removal+=1
                }
                else{
                    if bot.rolls[i] == bot.rolls.max(){
                        bot.tray.append(bot.rolls[i])
                        removal+=1
                    }
                }
            case 4:
                if bot.tray.contains(4)==false && bot.rolls[i]==4{
                    bot.tray.append(bot.rolls[i])
                    removal+=1
                }
                else{
                    if bot.rolls[i] == bot.rolls.max(){
                        bot.tray.append(bot.rolls[i])
                        removal+=1
                    }
                }
            default:
                if bot.rolls[i] == bot.rolls.max(){
                    // if bot.tray.contains(1) && bot.tray.contains(4){
                    bot.tray.append(bot.rolls[i])
                    removal+=1
                }
            }
        } //end big for
        
        switch bot.name{
        case "red":
            for i in 0...bot.tray.count-1{
                switch i {
                case 0:
                    top_1.image = redVal[Int(bot.tray[i])]
                case 1:
                    top_2.image = redVal[Int(bot.tray[i])]
                case 2:
                    top_3.image = redVal[Int(bot.tray[i])]
                case 3:
                    top_4.image = redVal[Int(bot.tray[i])]
                case 4:
                    top_5.image = redVal[Int(bot.tray[i])]
                case 5:
                    top_6.image = redVal[Int(bot.tray[i])]
                default:
                    print("error")
                }//end switch
            }//end case red
            
        case "anne":
            for i in 0...bot.tray.count-1{
                switch i {
                case 0:
                    left_1.image = anneVal[Int(bot.tray[i])]
                case 1:
                    left_2.image = anneVal[Int(bot.tray[i])]
                case 2:
                    left_3.image = anneVal[Int(bot.tray[i])]
                case 3:
                    left_4.image = anneVal[Int(bot.tray[i])]
                case 4:
                    left_5.image = anneVal[Int(bot.tray[i])]
                case 5:
                    left_6.image = anneVal[Int(bot.tray[i])]
                default:
                    print("error")
                }//end switch
            }//end case anne
            
        case "paul":
            for i in 0...bot.tray.count-1{
                switch i {
                case 0:
                    right_1.image = paulVal[Int(bot.tray[i])]
                case 1:
                    right_2.image = paulVal[Int(bot.tray[i])]
                case 2:
                    right_3.image = paulVal[Int(bot.tray[i])]
                case 3:
                    right_4.image = paulVal[Int(bot.tray[i])]
                case 4:
                    right_5.image = paulVal[Int(bot.tray[i])]
                case 5:
                    right_6.image = paulVal[Int(bot.tray[i])]
                default:
                    print("error")
                }//end switch
            }//end case inkline
            
        default:
            print("bad error")
        }//end name corresponding to dice switch
        
        print(removal.description + " dice are being removed")
        
        for x in 0...removal-1{
            bot.rolls.removeLast()
        }
        print(bot.rolls.count.description + " will be rolled next time")
        
        print("After the keep, bot's tray is: " + bot.tray.description)
    }//end cpuKeep
        
    func makePlayerList(number: Int){
        
        localPlayer.name = "Player"
        //add localPlayer to totalPlayers
        totalPlayers.append(localPlayer)
        
        //begin with full CPU array to choose from
        computerPlayers = [red, anneBonny, paul]
        
        for i in 0...number-1{
            //append CPU_Players to totalPlayers
            totalPlayers.append(computerPlayers[i])
        }
        
        for i in 0...totalPlayers.count-1{
            totalPlayers[i].icon = icons[i]!
        }
        for x in totalPlayers{
            if let player = x as? Player{
                sumScore(player: player.self)
                print(player.score)
            }
        }
        
        print("You have", number, "opponents")
        
        for i in 0...number{
            if i > 0 {
                totalPlayers[i].name = names[i]!
            }
            print(totalPlayers[i].name)
        }
        
        switch totalPlayers.count{
        case 2:
            left_7.isHidden = true
            left_8.isHidden = true
            ink_face.isHidden = true
            ink_board.isHidden = true
        case 3:
            ink_face.isHidden = true
            ink_board.isHidden = true
        default:
            break
        }
    }
        
    func prepareButton(){
        view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 150).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        iv.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        iv.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        for i in 1...12{
            sprite.append(UIImage(named: "spin\(i)")!)
        }
        animate()
    }
        
    @objc func animate(){
        iv.animationImages = sprite
        iv.animationDuration = 0.6
        iv.animationRepeatCount = -1
        iv.startAnimating()
    }
        
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        let scoreVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "scoreVC") as! ScoreViewController
        scoreVC.setScores(scoredPlayers: totalPlayers)
        self.addChild(scoreVC)
        scoreVC.view.frame=self.view.frame
        self.view.addSubview(scoreVC.view)
        scoreVC.didMove(toParent: self)
    }
        
    override func viewDidLoad() {
        
        //Prepares the first roll for the player at the start of the game
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        iv.addGestureRecognizer(tapGestureRecognizer)
        rollsDice = [diceButton1, diceButton2, diceButton3, diceButton4, diceButton5, diceButton6]
        trayDice = [trayViewTL, trayViewTM, trayViewTR, trayViewLL, trayViewLM, trayViewLR]
        roll()
        roundManager()
    }
}
