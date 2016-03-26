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
     let result = decideWinner("paper", computerChoice: getComputerChoice())
     winningMessage = result.0
     winningImage = result.1
     performSegueWithIdentifier("seeResults", sender: self)
        
    }
    
    @IBAction func chooseRock(sender: AnyObject) {
        let result = decideWinner("rock", computerChoice: getComputerChoice())
        winningMessage = result.0
        winningImage = result.1
        
    }
    @IBAction func chooseScissors(sender: AnyObject) {
        let result = decideWinner("scissors", computerChoice: getComputerChoice())
        winningMessage = result.0
        winningImage = result.1
    }
    
    // Returns winning message and image to use
    func decideWinner(moveChosen: String, computerChoice: String) -> (String, String) {
    
        switch(moveChosen, computerChoice) {
        case ("rock", "scissors"):
            return ("Rock breaks scissors. You win!", "RockCrushesScissors.jpg")
        case("scissors", "rock"):
            return ("Rock breaks scissors. You lose", "RockCrushesScissors.jpg")
        case("scissors", "paper"):
            return ("Scissors cut paper. You win!", "ScissorsCutPaper.jpg")
        case("paper", "scissors"):
            return ("Scissors cut paper. You lose!", "ScissorsCutPaper.jpg")
        case("paper", "rock"):
            return ("Paper covers rock. You win!", "PaperCoversRock.jpg")
        case("rock", "paper"):
            return ("Paper covers rock. You lose!", "PaperCoversRock.jpg")
        default:
            return ("It is a tie!", "itsATie.png")
            
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seeResults" {
            let controller = segue.destinationViewController as! ResultsViewController
            
            controller.resultMessage = winningMessage
            controller.resultImage = winningImage
        }
    }
}

