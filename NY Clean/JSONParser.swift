//
//  JSONParser.swift
//  NY Clean
//
//  Created by Iftikhar Khan on 4/7/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

struct RecycleBin: Decodable {
  
  let address: String?
  let borough: String?
  let latitude: String?
  let longitude: String?
  let park_site_name: String?
  let site_type: String?
  let userDistance: Double?
  
}

