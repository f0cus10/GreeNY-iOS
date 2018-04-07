//
//  ViewController.swift
//  NY Clean
//
//  Created by Joshua Geronimo on 4/7/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

struct RecycleBin: Decodable {
    
    let address: String?
    let borough: String?
    let latitude: String?
    let longitude: String?
    let park_site_name: String?
    let site_type: String?
    
}

class ViewController: UIViewController {

    
    let url = URL(string: "https://data.cityofnewyork.us/resource/ggvk-gyea.json?$$app_token=TsaFLCw8emTtCfbOt0MsufYue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let session = URLSession.shared
        let request = URLRequest(url: url!)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            do {
                let json = try JSONDecoder().decode([RecycleBin].self, from: data!)
                
                for bins in json {
                    print(bins.address ?? "no address")
                }
                
            } catch let jsonError {
                print("error, \(jsonError)")
            }
            
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

