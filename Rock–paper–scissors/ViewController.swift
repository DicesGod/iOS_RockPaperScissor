//
//  ViewController.swift
//  Rock–paper–scissors
//
//  Created by Minh Le on 2019-03-20.
//  Copyright © 2019 Minh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    enum Collection: String {
        case Rock
        case Paper
        case Scissor
        
        var image: UIImage {
            switch self {
            case .Rock: return UIImage(named: "Rock.png")!
            case .Paper: return UIImage(named: "Paper.png")!
            case .Scissor: return UIImage(named: "Scissors.png")!
            }
            
            }
        
    }
    
    //Random for the first time user play the game
    static func randomComSelection() -> String {
        let collectionArray = [Collection.Rock,Collection.Paper,Collection.Scissor]
        let index = Int(arc4random_uniform(3))
        let randomcomSelection = collectionArray[index].rawValue
        return randomcomSelection
        
    }
    
    var userSelection: String = ""
    var comSelection: String = ""
    var playwon = 0
    var comwon = 0
    var even = 0
    
    @IBOutlet weak var Player: UIImageView!
    @IBOutlet weak var Compare: UIImageView!
    @IBOutlet weak var Computer: UIImageView!
    
    @IBOutlet weak var WinnerIs: UITextField!
    @IBOutlet weak var PlayerWon: UITextField!
    @IBOutlet weak var ComputerWon: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WinnerIs.delegate = self
        PlayerWon.delegate  = self
        ComputerWon.delegate = self
    }

    @IBAction func Rock(_ sender: UIButton) {
        userSelection = Collection.Rock.rawValue
        Player.image = UIImage(named: "Rock.png")
        Play()
    }
    
    @IBAction func Paper(_ sender: Any) {
        userSelection = Collection.Paper.rawValue
         Player.image = UIImage(named: "Paper.png")
        Play()
    }
    
    @IBAction func Scissor(_ sender: Any) {
        userSelection = Collection.Scissor.rawValue
         Player.image = UIImage(named: "Scissors.png")
        Play()
    }
    
    func Play() -> Void {
        comSelection = ViewController.randomComSelection()
        if (comSelection == "Rock"){
            Computer.image = Collection.Rock.image}
        else if (comSelection == "Paper"){
            Computer.image = Collection.Paper.image}
        else {Computer.image = Collection.Scissor.image}
        
        if (userSelection == "Rock" && comSelection == "Scissor")
        {
            Compare.image = UIImage(named: "Larger.png")
            WinnerIs.text = "User Win!"
            playwon = playwon+1
            PlayerWon.text = "Player won: "+String(playwon)
            
        }
        else if (userSelection == "Rock" && comSelection == "Rock")
        {
            Compare.image = UIImage(named: "Equal.png")
            WinnerIs.text = "Even!"
            even = even+1
            //PlayerWon.text = String(playwon)
        }
        else if (userSelection == "Rock" && comSelection == "Paper")
        {
            Compare.image = UIImage(named: "Smaller.png")
            WinnerIs.text = "Computer Win!"
            comwon = comwon+1
            ComputerWon.text = "Computer won: "+String(comwon)
        }
        else if (userSelection == "Paper" && comSelection == "Rock")
        {
            Compare.image = UIImage(named: "Larger.png")
            WinnerIs.text = "User Win!"
            playwon = playwon+1
            PlayerWon.text = "Player won: "+String(playwon)
        }
        else if (userSelection == "Paper" && comSelection == "Paper")
        {
            Compare.image = UIImage(named: "Equal.png")
            WinnerIs.text = "Even!"
            even = even+1
            //PlayerWon.text = String(playwon)
        }
        else if (userSelection == "Paper" && comSelection == "Scissor")
        {
            Compare.image = UIImage(named: "Smaller.png")
            WinnerIs.text = "Computer Win!"
            comwon = comwon+1
            ComputerWon.text = "Computer won: "+String(comwon)
        }
        else if (userSelection == "Scissor" && comSelection == "Rock")
        {
            Compare.image = UIImage(named: "Smaller.png")
            WinnerIs.text = "Computer Win!"
            comwon = comwon+1
            ComputerWon.text = "Computer won: "+String(comwon)
        }
        else if (userSelection == "Scissor" && comSelection == "Paper")
        {
            Compare.image = UIImage(named: "Larger.png")
            WinnerIs.text = "User Win!"
            playwon = playwon+1
            PlayerWon.text = "Player won: "+String(playwon)
        }
        else{
            Compare.image = UIImage(named: "Equal.png")
            WinnerIs.text = "Even!"
            even = even+1
            //PlayerWon.text = String(playwon)
        }
    }
    
}

