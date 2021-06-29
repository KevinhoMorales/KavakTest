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
    
    public var coordinator: MainCoordinator?
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getData()
        refreshData()
        title = "Kavak - Kevin Morales"
    }
    
    private func setUpView() {
        let cell = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        LoadingIndicatorView.show(Constants.kLoading)
    }
    
    private func getData() {
        let networkManager = NetworkManager(delegate: self)
        networkManager.getTravelsData()
        viewModel.refreshControl.endRefreshing()
    }
    
    private func refreshData() {
        viewModel.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.backgroundView = viewModel.refreshControl
    }
    
    @objc
    private func refresh(_ sender: AnyObject) {
        getData()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        cell.setUpCell(model: viewModel.data, index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.detailView(model: viewModel.data)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: NetworkManagerDataResource {
    func getDataFromServer(data: [HomeModel]) {
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
                        tableView.isHidden = false
                    } else {
                        if viewModel.filterData.count == 0 {
                            tableView.isHidden = true
                        }
                    }
                }
            }
        }
        view.endEditing(true)
        tableView.reloadData()
        return true
    }
}
