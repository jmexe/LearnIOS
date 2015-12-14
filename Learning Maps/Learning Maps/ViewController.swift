//
//  ViewController.swift
//  Learning Maps
//
//  Created by Jmexe on 1/8/15.
//  Copyright (c) 2015 Jmexe. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var mapView: MKMapView!

    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Core Location
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        
        //42.656451, -71.327463
        
        var latitude : CLLocationDegrees = 42.656451
        var longtitude : CLLocationDegrees = -71.327463
        var latDelta : CLLocationDegrees = 0.01
        var longDelta : CLLocationDegrees = 0.01
        var span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        var region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        //Annotation
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Home"
        annotation.subtitle = "This is my home!"
        mapView.addAnnotation(annotation)
        
        //Gesture Recgniztion
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(uilpgr)
        
    }
    
    func action(gestureRecognizer : UIGestureRecognizer) {
        
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        var newCoordinate : CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        var newAnnotation = MKPointAnnotation()
        
        newAnnotation.coordinate = newCoordinate
        newAnnotation.title = "New Point"
        newAnnotation.subtitle = "Guess where is here ?"
        
        mapView.addAnnotation(newAnnotation)

        
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation : CLLocation = locations[0] as CLLocation
        
        var latitude : CLLocationDegrees = userLocation.coordinate.latitude
        var longtitude : CLLocationDegrees = userLocation.coordinate.longitude
        var latDelta : CLLocationDegrees = 0.01
        var longDelta : CLLocationDegrees = 0.01
        var span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        var region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

