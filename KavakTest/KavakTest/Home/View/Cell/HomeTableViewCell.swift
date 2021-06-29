//
//  HomeTableViewCell.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var dataImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(model: HomeModel, index: IndexPath) {
        nameLabel.text = model.brastlewark[0].name
        ageLabel.text = "\(model.brastlewark[0].age)"
        dataImageView.loadImageUsingCacheWithURLString(model.brastlewark[0].thumbnail, placeHolder: UIImage(systemName: "box"))
    }
    
    
    
}
