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
  var data: [RecycleBin]? /* will be initialized through segue */
  var userLatitude: CLLocationDegrees?
  var userLongitude: CLLocationDegrees?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  //TODO: Sort the entire json data
  func sortData(){
    
  }
  
  //Push view into MapController
  //MapController.userLatitude
  //MapController.userLongitude
  //MapController.dataArray == Array<RecycleBin>?
}
