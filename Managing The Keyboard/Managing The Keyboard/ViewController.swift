//
//  ViewController.swift
//  Managing The Keyboard
//
//  Created by Jmexe on 1/4/15.
//  Copyright (c) 2015 Jmexe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!

    @IBAction func buttonPressed(sender: AnyObject) {
        label.text = textField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}

