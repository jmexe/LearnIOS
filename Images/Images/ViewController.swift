//
//  ViewController.swift
//  Images
//
//  Created by Jmexe on 1/8/15.
//  Copyright (c) 2015 Jmexe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var alien: UIImageView!
    
    var counter = 1
    
    var timer = NSTimer()

    @IBAction func buttonPressed(sender: AnyObject) {
        /*
        counter = counter % 5 + 1
        
        alien.image = UIImage(named: "frame\(counter).png")
        */
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    func result() {
        counter = counter % 5 + 1
        
        alien.image = UIImage(named: "frame\(counter).png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidLayoutSubviews() {
        //alien.alpha = 0
        
        //alien.center = CGPointMake(alien.center.x - 400, alien.center.y + 200)
        
        //alien.frame = CGRectMake(100, 20, 0, 0)
    
    }

    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: {
            //self.alien.center = CGPointMake(self.alien.center.x + 400, self.alien.center.y - 200)
            //self.alien.alpha = 1
            
            //self.alien.frame = CGRectMake(100, 20, 100, 200)
        })
        
    }
    
}

