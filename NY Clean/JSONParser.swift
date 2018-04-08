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

func request(url: URL) -> Array<RecycleBin> {
  //Create a new session
  let session = URLSession.shared
  let request = URLRequest(url: url)
  //create a temp variable to put decoded values into
  var json: Array<RecycleBin>!
  //Async request
  let task = session.dataTask(with: request) { (data, response, error) in
    do {
      json = try JSONDecoder().decode([RecycleBin].self, from: data!)
      
//      for bins in json {
//        print(bins.address ?? "no address")
//      }
      
    }
    catch let jsonError {
      print("error, \(jsonError)")
    }
  }
  task.resume()
  
  return json;
}

