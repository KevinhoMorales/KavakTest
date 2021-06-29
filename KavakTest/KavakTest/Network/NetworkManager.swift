//
//  NetworkManager.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkManagerDataResource {
    func getDataFromServer(data: [HomeModel])
}

class NetworkManager {
    
    var arrayUsers = [HomeModel]()
    // PROPIEDAD DEL PROTOCOLO
    let delegate: NetworkManagerDataResource
    
    init(delegate: NetworkManagerDataResource) {
        self.delegate = delegate
    }
    
    func getTravelsData() {
        AF.request(Constants.kDataURL).responseJSON { [self] response in
            switch response.result {
            case .success:
                let myResult = try? JSON(data: response.data!)
                let documents = myResult!["Brastlewark"]
                for i in documents.arrayValue {
                    let id = i["id"].intValue
                    let name = i["name"].stringValue
                    let thumbnail = i["thumbnail"].stringValue
                    let hair_color = i["hair_color"].stringValue
                    let age = i["age"].intValue
                    let weight = i["weight"].doubleValue
                    let height = i["height"].doubleValue
                    let professions = i["professions"].arrayValue.map{$0.stringValue}
                    let friends = i["friends"].arrayValue.map{$0.stringValue}
                    
                    let user = HomeModel(brastlewark: [Brastlewark(id: id, name: name, thumbnail: thumbnail, age: age, weight: weight, height: height, hair_color: hair_color, professions: professions, friends: friends)])
                    arrayUsers.append(user)
                    delegate.getDataFromServer(data: arrayUsers)
                    LoadingIndicatorView.hide()
                }
            case .failure(let error):
                print("El nuevo error -> \(error.localizedDescription)")
                LoadingIndicatorView.hide()
            }
        }
    }
    
}


// Brastlewark(id: subJson["id"].int ?? 0, name: subJson["name"].string ?? "", thumbnail: subJson["thumbnail"].string ?? "", age: subJson["age"].int ?? 0, weight: subJson["weight"].double ?? 0.0, height: subJson["height"].double ?? 0.0, hair_color: subJson["hair_color"].string ?? "", professions: subJson["professions"].arrayValue.map { $0.stringValue} ?? [""], friends: subJson["friends"].arrayValue.map { $0.stringValue} ?? [""])
