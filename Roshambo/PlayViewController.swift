//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Gabriele on 3/24/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    var winningMessage: String!
    var winningImage: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func choosePaper(sender: AnyObject) {
        print(decideWinner("paper", computerChoice: getComputerChoice()))
        
    }
    
    @IBAction func chooseRock(sender: AnyObject) {
        print(decideWinner("rock", computerChoice: getComputerChoice()))
        
    }
    @IBAction func chooseScissors(sender: AnyObject) {
        print(decideWinner("scissors", computerChoice: getComputerChoice()))
        
    }
    
    // Returns winning message and image to use
    func decideWinner(moveChosen: String, computerChoice: String) -> (String, String) {
    
        switch(moveChosen, computerChoice) {
        case ("rock", "scissors"):
            return ("Rock breaks scissors. You win!", "RockCrushesScissors")
        case("scissors", "rock"):
            return ("Rock breaks scissors. You lose", "RockCrushesScissors")
        case("scissors", "paper"):
            return ("Scissors cut paper. You win!", "ScissorsCutPaper")
        case("paper", "scissors"):
            return ("Scissors cut paper. You lose!", "ScissorsCutPaper")
        case("paper", "rock"):
            return ("Paper covers rock. You win!", "PaperCoversRock")
        case("rock", "paper"):
            return ("Paper covers rock. You lose!", "PaperCoversRock")
        default:
            return ("It is a tie!", "itsATie")
            
        }
    }
    
    func getComputerChoice() -> String {
        let number = Int(arc4random_uniform(UInt32(3)))
        switch (number) {
        case 1:
            return "paper"
        case 2:
            return "scissors"
        default:
            return "rock"
        }
    }
    
}

