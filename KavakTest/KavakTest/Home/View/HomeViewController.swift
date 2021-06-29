//
//  HomeViewController.swift
//  KavakTest
//
//  Created by Kevin Morales on 6/29/21.
//

import UIKit

class HomeViewController: MainViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton! {
        didSet {
            backButton.isHidden = true
        }
    }
    
    public var coordinator: MainCoordinator?
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getData()
        refreshData()
        title = "Kevin Morales"
    }
    
    private func setUpView() {
        let cell = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: Constants.kCell)
        tableView.tableFooterView = UIView()
        LoadingIndicatorView.show(Constants.kLoading)
    }
    
    private func getData() {
        let networkManager = NetworkManager(delegate: self)
        networkManager.getTravelsData()
        viewModel.refreshControl.endRefreshing()
        searchTextField.text = ""
    }
    
    private func refreshData() {
        viewModel.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.backgroundView = viewModel.refreshControl
    }
    
    @objc
    private func refresh(_ sender: AnyObject) {
        getData()
    }
    
    @IBAction func backAction(_ sender: Any) {
        getData()
        show()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kCell) as! HomeTableViewCell
        let data = viewModel.filterData[indexPath.row]
        cell.setUpCell(model: data, index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.filterData[indexPath.row]
        coordinator?.detailView(model: data)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: NetworkManagerDataResource {
    func getDataFromServer(data: [HomeModel]) {
        viewModel.filterData = data
        viewModel.data = data
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        searchTextField.text = ""
        viewModel.filterData.removeAll()
        for str in viewModel.data {
            viewModel.filterData.append(str)
        }
        tableView.reloadData()
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (searchTextField.text?.count)! != 0 {
            viewModel.filterData.removeAll()
            for str in viewModel.data {
                for i in str.brastlewark {
                    let range = i.name.lowercased().forSorting.range(of: searchTextField.text!.lowercased().forSorting, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil {
                        viewModel.filterData.append(str)
                        show()
                    } else {
                        if viewModel.filterData.count == 0 {
                            hide()
                        }
                    }
                }
            }
        }
        view.endEditing(true)
        tableView.reloadData()
        return true
    }
    
    private func show() {
        tableView.isHidden = false
        backButton.isHidden = true
    }
    
    private func hide() {
        tableView.isHidden = true
        backButton.isHidden = false
    }
}
