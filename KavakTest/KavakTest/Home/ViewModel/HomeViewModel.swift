//
//  HomeViewModel.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

class HomeViewModel {
    public var refreshControl = UIRefreshControl()
    public var data = [HomeModel]()
    public var filterData: [HomeModel] = []
}
