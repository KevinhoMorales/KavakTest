//
//  Coordinator.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    func homeView()
}
