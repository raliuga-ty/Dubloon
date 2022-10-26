import UIKit

class AnimateViewController: UIViewController {

    let iv : UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "spin1.png")
        return iv
    }()
    
    var sprite = [UIImage]()
    
    var hold = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 150).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        iv.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        iv.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        for i in 1...12{
            sprite.append(UIImage(named: "spin\(i)")!)
        }
        showMain()
    }
    
    @objc func animate(){
        iv.animationImages = sprite
        iv.animationDuration = 0.5
        iv.animationRepeatCount = 1
        iv.startAnimating()
        }
    
    func showMain(){
        let mainVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "menuVC") as! ViewController
        self.addChild(mainVC)
        mainVC.view.frame = self.view.frame
        
        self.view.addSubview(mainVC.view)
        mainVC.didMove(toParent: self)
        }
    }
