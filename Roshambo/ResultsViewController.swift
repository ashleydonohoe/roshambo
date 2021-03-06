//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Gabriele on 3/25/16.
//  Copyright © 2016 Ashley Donohoe. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var resultMessage: String!
    var resultImage: String!

    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = resultMessage
        print(resultImage)
        
        image.image = UIImage(named: resultImage)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playAgain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
