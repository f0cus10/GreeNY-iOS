//
//  MapController.swift
//  NY Clean
//
//  Created by Iftikhar Khan on 4/7/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController {
  //Outlet to control the map
  @IBOutlet weak var map: MKMapView!
  
  var userLatitude: CLLocationDegrees?
  var userLongitude: CLLocationDegrees?
  
  
  var center: CLLocationCoordinate2D!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //Manipulate MapView
    if let userLatitude = userLatitude, let userLongitude = userLongitude {
      center = CLLocationCoordinate2DMake(userLatitude, userLongitude)
    }
    
    showDirections()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  func showDirections(){
    //Annotate the user's location
    let myAnnotation: MKPointAnnotation = MKPointAnnotation()
    if let center = center {
      myAnnotation.coordinate = center
    }
    myAnnotation.title = "Current Locatio"
    map.addAnnotation(myAnnotation)
    
    //For each item in the array, annotate those locations
    
  }
}
