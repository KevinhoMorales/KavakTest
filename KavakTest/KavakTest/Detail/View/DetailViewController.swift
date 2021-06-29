//
//  DetailViewController.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

class DetailViewController: MainViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    
    public var model = [HomeModel]()
    public var coordinator: MainCoordinator?
    private var viewModel = DetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }

    func setUpView() {
        title = model[0].brastlewark[0].name
        dataImageView.loadImageUsingCacheWithURLString(model[0].brastlewark[0].thumbnail, placeHolder: UIImage(systemName: "box"))
        ageLabel.text = "\(model[0].brastlewark[0].age)"
        weightLabel.text = "\(model[0].brastlewark[0].weight)"
        heightLabel.text = "\(model[0].brastlewark[0].height)"
        hairColorLabel.text = model[0].brastlewark[0].hair_color
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[0].brastlewark[0].professions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(model[0].brastlewark[0].professions[indexPath.row])"
        return cell
    }
    
    
}
