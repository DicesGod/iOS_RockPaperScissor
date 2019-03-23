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
    //Index 1 = Rock, Index 2 = Paper, Index 3 = Scissor
    var UserSelection:Array<Double> = [0,0,0]
    var predict = 0
    
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
        UserSelection[0] = UserSelection[0]+1
        predict = softmax(UserSelection)
        Play(predict: predict)
    }
    
    @IBAction func Paper(_ sender: Any) {
        userSelection = Collection.Paper.rawValue
         Player.image = UIImage(named: "Paper.png")
        UserSelection[1] = UserSelection[1]+1
        predict = softmax(UserSelection)
        Play(predict: predict)
    }
    
    @IBAction func Scissor(_ sender: Any) {
        userSelection = Collection.Scissor.rawValue
         Player.image = UIImage(named: "Scissors.png")
        UserSelection[2] = UserSelection[2]+1
        predict = softmax(UserSelection)
        Play(predict: predict)
    }
    
    func Play(predict:Int) -> Void {
        //comSelection = ViewController.randomComSelection()
        switch (predict) {
        case 0:
            comSelection = "Paper"
            Computer.image = Collection.Paper.image
            break;
        case 1:
            comSelection = "Scissor"
            Computer.image = Collection.Scissor.image
            break;
        case 2:
            comSelection = "Rock"
            Computer.image = Collection.Rock.image
            
            break;
        default:
            break;
        }
      
        
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
    
    //Calculate the percentage of next user's selection
    func softmax(_ numbers:Array<Double>) -> Int{
        var exp_sum:Double = 0
        for number in numbers {
            exp_sum += exp(number)
            print(exp_sum)
        }
        var result:Array<Double> = []
        for number in numbers {
            result.append(exp(number) / exp_sum)
        }
        let maxPosition = result.firstIndex(of: result.max()!)
        return maxPosition!
    }
}

