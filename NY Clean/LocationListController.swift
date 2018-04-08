//
//  LocationListController.swift
//  NY Clean
//
//  Created by Iftikhar Khan on 4/7/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import CoreLocation

class LocationListController: UIViewController {
  
  //JSON DATA
  var data: Array<RecycleBin>!
  var userLatitude: CLLocationDegrees!
  var userLongitude: CLLocationDegrees!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
