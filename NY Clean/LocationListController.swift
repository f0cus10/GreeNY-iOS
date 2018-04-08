//
//  LocationListController.swift
//  NY Clean
//
//  Created by Iftikhar Khan on 4/7/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import CoreLocation

class LocationListController: UITableViewController {
  
  //JSON DATA
  var data: [RecycleBin]? /* will be initialized through segue */
  var userLatitude: CLLocationDegrees?
  var userLongitude: CLLocationDegrees?
  
  //Array to be passed on later
  var passArray: [RecycleBin]?
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (data?.count)!
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "BinName", for: indexPath)
    
    cell.textLabel?.text = data?[indexPath.row].address ?? "No Address"
    
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    sortData()
    self.tableView.reloadData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //If a row is selected, take the indexes that are nearby to the user.
    //2 from the bottom, 2 from the top and pass them into the map
    passArray = Array<RecycleBin>()
    for i in 0...5 {
      passArray?.append(self.data![indexPath.row+i])
    }
    
    performSegue(withIdentifier: "map", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? MapController {
      vc.dataArray = self.data
      vc.userLatitude = self.userLatitude
      vc.userLongitude = self.userLongitude
    }
  }
  
  //TODO: Sort the entire json data
  func sortData(){
    //For the entire collection, calculate the data against the user location
    if var data = data {
      let newData = calculateDistance(array: data)
      //Take the newly constructed array and sort it since it follows Comparable protocol
      self.data = newData.sorted()
    }
  }
  
  func calculateDistance( array: [RecycleBin] ) -> Array<RecycleBin> {
    var newData = Array<RecycleBin>()
    //We assume deg_length is 110.25
    let deg_length: Double = 110.25
    //For each of the variables in the array, calculate the distance b/t the user and the RecycleBin
    for var bin in array{
      if let lat = bin.latitude, let long = bin.longitude {
        print(bin.address ?? "No Address")
        let distX = userLatitude! - Double(lat)!
        let distY = ((userLongitude! - Double(long)!) * cos(Double(lat)!))
        let distance = deg_length * sqrt((distX * distX) + (distY * distY))
        bin.setUserDistance(distance: distance)
        newData.append(bin)
      }
    }
    return newData
  }
  
  //Push view into MapController
  //MapController.userLatitude
  //MapController.userLongitude
  //MapController.dataArray == Array<RecycleBin>?
  
}
