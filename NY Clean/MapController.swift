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
  
  var dataArray: Array<RecycleBin>?
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
    myAnnotation.title = "Current Location"
    map.addAnnotation(myAnnotation)
    
    //For each item in the array, annotate those locations
    if let dataArray = dataArray {
      for each in dataArray {
        //Instantiate a new annotation
        let annotation: MKPointAnnotation = MKPointAnnotation()
        //Set the coordinates of the annotation
        if let lat = each.latitude, let long = each.longitude {
          //Convert the lat and long to double values and set them as co-ordinates
          let doubleLatitude = Double(lat)
          let doubleLongitude = Double(long)
          annotation.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(doubleLatitude!), CLLocationDegrees(doubleLongitude!))
        }
        //Add annotation title
        annotation.title = each.address ?? "No Address"
        map.addAnnotation(annotation)
      }
    }
    
  }
}
