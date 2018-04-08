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
  var userDistance: Double?
}

extension RecycleBin {
  mutating func setUserDistance(distance: Double){
    self.userDistance = distance
  }
}
extension RecycleBin: Comparable {
  static func < (lhs: RecycleBin, rhs: RecycleBin) -> Bool {
    if let left = lhs.userDistance, let right = rhs.userDistance{
      if left != right {
        return left < right
      }
      return false
    }
    return false
  }
  
  static func == (lhs: RecycleBin, rhs: RecycleBin)-> Bool {
    return lhs.userDistance == rhs.userDistance
  }
}

