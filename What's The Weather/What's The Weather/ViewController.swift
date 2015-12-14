//
//  ViewController.swift
//  What's The Weather
//
//  Created by Jmexe on 1/7/15.
//  Copyright (c) 2015 Jmexe. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!

    @IBOutlet weak var cityTextField: UITextField!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        
        var urlString = "http://www.weather-forecast.com/locations/" + cityTextField.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        var url = NSURL(string: urlString)
        
        let sharedSession = NSURLSession.sharedSession()
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            let tempUrlContent : String = urlContent as String
            
            if (tempUrlContent.rangeOfString("<span class=\"phrase\">") != nil) {
            
                var contentArray = urlContent?.componentsSeparatedByString("<span class=\"phrase\">")
            
                var newContentArray = contentArray?[1].componentsSeparatedByString("</span>")
                println(newContentArray?[0])
            
                dispatch_async(dispatch_get_main_queue()) {
                    self.messageLabel.text = newContentArray![0].stringByReplacingOccurrencesOfString("&deg;", withString: "º") as String
                }
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.messageLabel.text = "Could not find the city - please try again"
            }
            
        
        }
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

