//
//  ViewController.swift
//  Where Am I
//
//  Created by Jmexe on 1/12/15.
//  Copyright (c) 2015 Jmexe. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latitudeLabel:   UILabel!
    @IBOutlet weak var longtitudeLabel: UILabel!
    @IBOutlet weak var headingLabel:    UILabel!
    @IBOutlet weak var speedLabel:      UILabel!
    @IBOutlet weak var altitudeLabel:   UILabel!
    @IBOutlet weak var addressLabel:    UILabel!
    
    
    var manager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation : CLLocation = locations[0] as CLLocation
        
        latitudeLabel.text      = "\(userLocation.coordinate.latitude)"
        longtitudeLabel.text    = "\(userLocation.coordinate.longitude)"
        headingLabel.text       = "\(userLocation.course)"
        speedLabel.text         = "\(userLocation.speed)"
        altitudeLabel.text      = "\(userLocation.altitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler :
            {(placemarks, error) in
                
            if error != nil {println(error)}
            else {
                let p = CLPlacemark(placemark: placemarks[0] as CLPlacemark)
                
                
                var addressText = "\(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \n \(p.country)"
                
                
                if (p.subThoroughfare != nil) {
                    addressText = "\(p.subThoroughfare) " + addressText
                }
                
                self.addressLabel.text = addressText
                
                
            }
            
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

