//
//  HomeModel.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import Foundation

struct HomeModel {
    var brastlewark: [Brastlewark]
}

struct Brastlewark {
    var id: Int
    var name: String
    var thumbnail: String
    var age: Int
    var weight: Double
    var height: Double
    var hair_color: String
    var professions: [String]
    var friends: [String]
}
