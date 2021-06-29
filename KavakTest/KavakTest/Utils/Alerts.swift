//
//  Alerts.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

class Alerts {
    static public func warning(title: String, buttonTitle: String, viewcontroller: UIViewController) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        viewcontroller.present(alert, animated: true, completion: nil)
    }
    static public func warningAlert(title: String, buttonTitle: String, viewcontroller: UIViewController, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: completion))
        viewcontroller.present(alert, animated: true, completion: nil)
    }
}
