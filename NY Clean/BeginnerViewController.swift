//
//  BeginnerViewController.swift
//  NY Clean
//
//  Created by Joshua Geronimo on 4/7/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import CoreLocation

class BeginnerViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var myLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Load background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg_central_park")
        //Set contentmode to full-screen aspect ratio for background effect
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        //Insert constructed image at background
        self.view.insertSubview(backgroundImage, at: 0)
        
        print("View has loaded")
    }
    
    @IBAction func showButton(){
        //Make an API call and change the label accordingly
        print("Button Pressed")
        let data = request(url: URL(string: "https://data.cityofnewyork.us/resource/ggvk-gyea.json?$$app_token=TsaFLCw8emTtCfbOt0MsufYue")!)
        //Instantiate a new viewController
        let controller = LocationListController()
        //Pass the value into controller
        //Get the userlocation data
        controller.data = data
        if let myLocation = myLocation {
            controller.userLatitude = myLocation.coordinate.latitude
            controller.userLongitude = myLocation.coordinate.longitude
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    //Delegate function
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let userLocation: CLLocation = locations[0] as CLLocation
        manager.stopUpdatingLocation()
        myLocation = userLocation
    }
    
    func determineCurrentLocation() {
        self.locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
}

