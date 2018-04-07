//
//  BeginnerViewController.swift
//  NY Clean
//
//  Created by Joshua Geronimo on 4/7/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit


class BeginnerViewController: UIViewController, MK {
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        map = MKMapView()
        
        print("View has loaded")
    }
    
    @IBAction func showButton(){
        //Make an API call and change the label accordingly
        print("Button Pressed")
    }
    
}

