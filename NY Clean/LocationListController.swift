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
    let url = URL(string: "https://data.cityofnewyork.us/resource/ggvk-gyea.json?$$app_token=TsaFLCw8emTtCfbOt0MsufYue")
    data = request(url: url!)
    
  }
}
