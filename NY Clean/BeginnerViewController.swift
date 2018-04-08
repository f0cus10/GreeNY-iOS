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
    var myData = Array<RecycleBin>()
    
    //Define hardcoded URL
    let url = URL(string: "https://data.cityofnewyork.us/resource/ggvk-gyea.json?$$app_token=TsaFLCw8emTtCfbOt0MsufYue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg_central_park")
        //Set contentmode to full-screen aspect ratio for background effect
        backgroundImage.contentMode = UIViewContentMode.scaleToFill
        //Insert constructed image at background
        self.view.insertSubview(backgroundImage, at: 0)
        
        print("View has loaded")
        
        //Create an async request to make an API Call
        let session = URLSession.shared
        let request = URLRequest(url: url!)
        
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do {
                let json = try JSONDecoder().decode([RecycleBin].self, from: data!)
                
                for each in json {
                    self.myData.append(each)
                    //print(each.address ?? "no address")
                }
                
            } catch let jsonError {
                print ("Error, \(jsonError)")
            }
        }
        task.resume()
        determineCurrentLocation()
    }
    
    
    @IBAction func showBins(_ sender: Any) {
        performSegue(withIdentifier: "hi", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
       
        if let vc = segue.destination as? LocationListController {
            vc.data = self.myData
            vc.userLatitude = self.myLocation.coordinate.latitude
            vc.userLongitude = self.myLocation.coordinate.longitude
            
            //performSegue(withIdentifier: "hi", sender: nil)
        }
        
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

