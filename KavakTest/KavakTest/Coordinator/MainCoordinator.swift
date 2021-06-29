//
//  MainCoordinator.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController = UINavigationController()
    
    func homeView() {
        let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeView.coordinator = self
        navigationController.pushViewController(homeView, animated: true)
    }
    
    func detailView(model: HomeModel) {
        let detailView = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailView.coordinator = self
        detailView.model = model
        navigationController.pushViewController(detailView, animated: true)
    }
    
}
