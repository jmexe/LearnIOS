//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Jmexe on 1/8/15.
//  Copyright (c) 2015 Jmexe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playAgainButton: UIButton!

    @IBOutlet weak var infoLabel: UILabel!
    
    var goNumber = 1
    //0 = no one wins, 1 = nought, 2 = cross
    var winner = 0
    
    //0 = empty, 1 = nought, 2 = cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                                [0, 3, 6], [1, 4, 7], [2, 5, 8],
                                [0, 4, 8], [2, 4, 6]]
    
    @IBOutlet var button0: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        //Reset all the variables
        goNumber = 1
        
        winner = 0
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        //Hide the label and button
        infoLabel.alpha = 0
        
        infoLabel.center = CGPointMake(infoLabel.center.x - 400, infoLabel.center.y)
        
        playAgainButton.alpha = 0
        
        var button : UIButton
        //Since many elements have tag 0, so just reset the buttons whose tag is not 0
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && winner == 0) {
            var imageName = "cross.png"
            gameState[sender.tag] = 2
            
            if(goNumber % 2 == 1) {
                imageName = "nought.png"
                gameState[sender.tag] = 1
            }
            var image = UIImage(named: imageName)
            
            //Check the winner
            for combination in winningCombinations {
                if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[0]] == gameState[combination[2]] && gameState[combination[0]] != 0) {
                    winner = gameState[combination[0]]
                }
            }
            
            if (winner != 0) {
                println("We have a winner!")
                
                if (winner == 1) {
                    infoLabel.text = "Noughts has won!"
                }
                else {
                    infoLabel.text = "Crosses has won!"
                }
                
                UIView.animateWithDuration(1, animations: {
                    self.infoLabel.alpha = 1
                    self.infoLabel.center = CGPointMake(self.infoLabel.center.x + 400, self.infoLabel.center.y)
                    
                    self.playAgainButton.alpha = 1
                })
            }
            
            goNumber++
            sender.setImage(image, forState: .Normal)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        infoLabel.alpha = 0
        infoLabel.center = CGPointMake(infoLabel.center.x - 400, infoLabel.center.y)
        
        playAgainButton.alpha = 0
    }


}

