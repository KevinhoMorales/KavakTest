//
//  MainViewController.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkNetwork()
        // Do any additional setup after loading the view.
    }
    
    private func checkNetwork() {
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
        } else {
            Alerts.warning(title: "Please Check Network", buttonTitle: "OK", viewcontroller: self)
        }
    }

}
