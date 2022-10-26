import UIKit
class ScoreViewController: UIViewController {
    
    var sortedScores : [Player] = []
    
    var sprite = [UIImage]()
    var coins = [UIImageView]()
    var playerScore = 0
    var maxScore = 0
    var count = 0

    //scores for each player
    @IBOutlet weak var scoreOne: UIImageView!
    @IBOutlet weak var scoreTwo: UIImageView!
    @IBOutlet weak var scoreThree: UIImageView!
    @IBOutlet weak var scoreFour: UIImageView!
    
    //icons for each player corresponding in their score order
    @IBOutlet weak var iconOne: UIImageView!
    @IBOutlet weak var iconTwo: UIImageView!
    @IBOutlet weak var iconThree: UIImageView!
    @IBOutlet weak var iconFour: UIImageView!
    
    @IBAction func playAgain(_ sender: UIButton) {
        let goHome = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "menuVC") as! ViewController
        self.addChild(goHome)
        goHome.view.frame = self.view.frame
        self.view.addSubview(goHome.view)
        goHome.didMove(toParent: self)
        playSound(sound:"click", type:"wav")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setScreen()
    }
    
    @objc func animate(){
        for x in coins{
            if let coin = x as? UIImageView{
                coin.animationImages = sprite
                coin.animationDuration = 0.9
                coin.animationRepeatCount = -1
                coin.startAnimating()
            }
        }
    }
    
    func setScores (scoredPlayers : [Player] ){
        for x in 0...scoredPlayers.count-1{
            sortedScores.append(scoredPlayers[x])
        }
        sortedScores = sortedScores.sorted(by: { $0.score > $1.score })
    }
         
    func setScreen(){
        //sets the icon of whoever is ranked 1st through 4th
        for rank in 0...sortedScores.count-1{
                switch rank{
                case 0:
                    iconOne.image = sortedScores[rank].icon
                    scoreOne.image = (UIImage(named: "score\(sortedScores[rank].score.description)")!)
                    maxScore = sortedScores[rank].score
                case 1:
                    iconTwo.image = sortedScores[rank].icon
                    scoreTwo.image = (UIImage(named: "score\(sortedScores[rank].score.description)")!)
                case 2:
                    iconThree.image = sortedScores[rank].icon
                    scoreThree.image = (UIImage(named: "score\(sortedScores[rank].score.description)")!)
                case 3:
                    iconFour.image = sortedScores[rank].icon
                    scoreFour.image = (UIImage(named: "score\(sortedScores[rank].score.description)")!)
                default:
                    print("error")}
        }

        //initialize all possible coins in the scoreboard
        let imageName = "goldCoin.png"
        let coin = UIImage(named: imageName)
        let imageView1 = UIImageView(image: coin!)
        let imageView2 = UIImageView(image: coin!)
        let imageView3 = UIImageView(image: coin!)
        let imageView4 = UIImageView(image: coin!)
        let imageView5 = UIImageView(image: coin!)
        let imageView6 = UIImageView(image: coin!)
        let imageView7 = UIImageView(image: coin!)
        let imageView8 = UIImageView(image: coin!)
        let imageView9 = UIImageView(image: coin!)
        let imageView10 = UIImageView(image: coin!)
        let imageView11 = UIImageView(image: coin!)
        let imageView12 = UIImageView(image: coin!)
        let imageView13 = UIImageView(image: coin!)
        let imageView14 = UIImageView(image: coin!)
        let imageView15 = UIImageView(image: coin!)
        let imageView16 = UIImageView(image: coin!)
        let imageView17 = UIImageView(image: coin!)
        let imageView18 = UIImageView(image: coin!)
        let imageView19 = UIImageView(image: coin!)
        let imageView20 = UIImageView(image: coin!)
         
        
        //first place gets 1-5
        
        imageView1.frame = CGRect(x: 280, y: 230, width: 30, height: 30)
        imageView2.frame = CGRect(x: 305, y: 230, width: 30, height: 30)
        imageView3.frame = CGRect(x: 330, y: 230, width: 30, height: 30)
        imageView4.frame = CGRect(x: 290, y: 250, width: 30, height: 30)
        imageView5.frame = CGRect(x: 315, y: 250, width: 30, height: 30)
        
        //second place gets 6-10
        
        imageView6.frame = CGRect(x: 280, y: 335, width: 30, height: 30)
        imageView7.frame = CGRect(x: 305, y: 335, width: 30, height: 30)
        imageView8.frame = CGRect(x: 330, y: 335, width: 30, height: 30)
        imageView9.frame = CGRect(x: 290, y: 355, width: 30, height: 30)
        imageView10.frame = CGRect(x: 315, y: 355, width: 30, height: 30)
        
        //third place gets 11-15

        imageView11.frame = CGRect(x: 280, y: 440, width: 30, height: 30)
        imageView12.frame = CGRect(x: 305, y: 440, width: 30, height: 30)
        imageView13.frame = CGRect(x: 330, y: 440, width: 30, height: 30)
        imageView14.frame = CGRect(x: 290, y: 460, width: 30, height: 30)
        imageView15.frame = CGRect(x: 315, y: 460, width: 30, height: 30)
        
        //fourth place gets 16-20
        
        imageView16.frame = CGRect(x: 280, y: 550, width: 30, height: 30)
        imageView17.frame = CGRect(x: 305, y: 550, width: 30, height: 30)
        imageView18.frame = CGRect(x: 330, y: 550, width: 30, height: 30)
        imageView19.frame = CGRect(x: 290, y: 570, width: 30, height: 30)
        imageView20.frame = CGRect(x: 315, y: 570, width: 30, height: 30)
        
        //show all coins to begin with, they will be removed as necessary
        
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        view.addSubview(imageView3)
        view.addSubview(imageView4)
        view.addSubview(imageView5)
        view.addSubview(imageView6)
        view.addSubview(imageView7)
        view.addSubview(imageView8)
        view.addSubview(imageView9)
        view.addSubview(imageView10)
        view.addSubview(imageView11)
        view.addSubview(imageView12)
        view.addSubview(imageView13)
        view.addSubview(imageView14)
        view.addSubview(imageView15)
        view.addSubview(imageView16)
        view.addSubview(imageView17)
        view.addSubview(imageView18)
        view.addSubview(imageView19)
        view.addSubview(imageView20)
         
        //add all ImageViews above to coins array
        
        
        //first place index 0-4
        coins.append(imageView1)
        coins.append(imageView2)
        coins.append(imageView3)
        coins.append(imageView4)
        coins.append(imageView5)
        
        //second place index 5-9
        coins.append(imageView6)
        coins.append(imageView7)
        coins.append(imageView8)
        coins.append(imageView9)
        coins.append(imageView10)
        
        //third place index 10-14
        coins.append(imageView11)
        coins.append(imageView12)
        coins.append(imageView13)
        coins.append(imageView14)
        coins.append(imageView15)
        
        //fourth place index 15-19
        coins.append(imageView16)
        coins.append(imageView17)
        coins.append(imageView18)
        coins.append(imageView19)
        coins.append(imageView20)
        
        //animation images
        for i in 1...6{
            sprite.append(UIImage(named: "shine\(i)")!)
        }
        
        //before starting the loop, set maxScore based on the highest score of the player
        maxScore = sortedScores[0].score
            
        //begin the for loop that will remove coin ImageViews according with their rank
        switch sortedScores.count{
        case 2:
            for i in 10...19{
                coins[i].isHidden = true
            }
        case 3:
            for i in 14...19{
                coins[i].isHidden = true
            }
        default:
            print("ok")
        }
        
        for i in sortedScores{
            //begin iterating through the sortedScores array as sequential Player objects
            
            if let player = i as? Player{
                //player did not qual, they will not get any coins
                if player.score == 0{
                    coins[count*5 + 0].isHidden = true
                    coins[count*5 + 1].isHidden = true
                    coins[count*5 + 2].isHidden = true
                    coins[count*5 + 3].isHidden = true
                    coins[count*5 + 4].isHidden = true
                }//end 0 score
                //player is second place or tied for second place and will
                //receive 3 coins, so we remove two
                if player.score < maxScore{
                    coins[count*5 + 2].isHidden = true
                    coins[count*5 + 4].isHidden = true
                }//end less than max
                //player has a lower score than what the second
                //place player scored, making them third. we
                //remove 2 of their remaining 3 coins, they keep 1
                if player.score < playerScore{
                   // print("player score is currently " + playerScore.description)
                    coins[count*5 + 1].isHidden = true
                    coins[count*5 + 3].isHidden = true
                }//end less than playerScore
                //because we are making this loop through the sortedScores
                //sortedScores array, we know that if we are in the last
                //iteration and the score is less than the playerScore var,
                //the current score must be the lowest
                if player.score < playerScore && count == 3{
                    coins[count*5].isHidden = true
                    coins[count*5 + 1].isHidden = true
                    coins[count*5 + 3].isHidden = true
                }//end fourth place
                
                //none of the above solutions account for what happens if
                //player.score is the same as the playerScore var. If this
                //happens, we compare it to each element's score preceding it
                //and remove coins as necessary
                if player.score == playerScore{
                    for i in 0...count-1{
                        if player.score < sortedScores[i].score{
                            if i == 0{
                                coins[count*5 + 2].isHidden = true
                                coins[count*5 + 4].isHidden = true
                                }
                            if i == 1{
                                coins[count*5 + 1].isHidden = true
                                coins[count*5 + 3].isHidden = true
                                }
                            if i == 2 && sortedScores[i-1].score != sortedScores[i].score{
                                coins[count*5].isHidden = true
                                }
                        } //end compare element by element if
                    } //end for loop
                } //end player.score == playerScore
                //b çƒ∂åwe don't want playerScore and maxScore to have the same
                //value because the comparisons to them remove different
                //coins, respectively. We know that when count = 0, we are
                //on the top scoring player. We skip over the setting of the
                //playerScore var if the player has the same score for the same
                //reason
                if count > 0 && player.score != maxScore{
                    playerScore = player.score
                }//end playerScore assignment if
            } //end if let
        count += 1
        } //end for
        animate()
    }
}
