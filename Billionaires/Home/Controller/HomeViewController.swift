//
//  HomeViewController.swift
//  Billionaires
//
//  Created by Umair Hanif on 22/08/2022.
//

import UIKit
import NVActivityIndicatorView

class HomeViewController: UIViewController {
    
    
    //MARK: - @IBOutlet
    @IBOutlet var mainView: HomeView!
    
    
    //MARK: - Variables and Instances
    private let viewModel = HomeViewModel()
    private var filteredData = [HomeViewModel]()
    private var data = [HomeViewModel]()
    
    
    //MARK: - @LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachability.isConnectedToNetwork() {
            self.proceed()
        } else {
            self.showAlert(title: "Error", message: "Please check your internet connection and try again...")
        }
        
    }
    
    
    
    //MARK: - Custom Functions
    private func proceed() {
        
        Helper.addActivityIndicator(self.view)
        Helper.loader?.startAnimating()
        setUpTableView()
        viewModel.getBillionairesData()
        setupBinders()
    }
    
    private func showAlert(title: String, message: String) {
        
        let controller = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
            exit(0)
        }
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }
    
    private func setupBinders() {
        
        viewModel.data.bind { [weak self] data in
            if let data = data {
                
                self?.filteredData = data
                self?.data = data
                self?.mainView.tableView.reloadData()
                self?.mainView.searchField.delegate = self
                
            } else {
                self?.showAlert(title: "Error", message: "Internal error occures. Please try again later...")
            }
        }
        
    }
    
    private func setUpTableView() {
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.register(UINib(nibName: "PersonsTableViewCell", bundle: nibBundle), forCellReuseIdentifier: "PersonsTableViewCell")
    }
    
    
    
    
    
    
    
    
    
}


//MARK: - TableView Methods
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PersonsTableViewCell", for: indexPath) as? PersonsTableViewCell {
            
            cell.data = self.filteredData[indexPath.row]
            cell.assignData()
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.data = self.filteredData[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
}



extension HomeViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            if text != "" {
                self.filteredData = self.data.filter { $0.fullName?.lowercased().range(of: text) != nil }
                self.mainView.tableView.reloadData()
            } else {
                self.filteredData = data
                self.mainView.tableView.reloadData()
                self.view.endEditing(true)
            }
        }
    }
}
