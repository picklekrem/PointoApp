//
//  ViewController.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 29.10.2022.
//

import UIKit
import Foundation

class MainViewController: UIViewController {

    @IBOutlet weak var subsTableView: UITableView!
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner()
        viewModel.configureTable(table: subsTableView)
        viewModel.fetchData()
        viewModel.didDataFetched = { isFetched in
            if isFetched {
                DispatchQueue.main.async {
                    self.subsTableView.reloadData()
                    self.removeSpinner()
                }
            } else {
                DispatchQueue.main.async {
                    self.makeAlert(titleInput: "Error!", messageInput: "Error occured!")
                    self.removeSpinner()
                }
            }
        }
    }

}

