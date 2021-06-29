//
//  CustomButton.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupButton()
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        layer.backgroundColor = UIColor.systemBlue.cgColor
        layer.cornerRadius = CGFloat(15)
    }
    
}
