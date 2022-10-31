//
//  NewSubViewController.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 30.10.2022.
//

import UIKit

class NewSubViewController: UIViewController {

    @IBOutlet weak var firstSectionView: UIView!
    @IBOutlet weak var secondSectionView: UIView!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpButtonOutlet: UIButton!
    
    @IBOutlet weak var privButtonOutlet: UIButton!
    @IBOutlet weak var realButtonOutlet: UIButton!
    
    @IBOutlet weak var subsTypeView: CustomDropdown!
    
    let subListType = ["Mesken (Konut)", "Sample", "Sample2", "Sample3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    func configureUI () {
        self.hideKeyboardWhenTappedAround()
        firstSectionView.roundCorner(1,8,.lightGray)
        secondSectionView.roundCorner(1,8,.lightGray)
        popUpView.roundCorner(1, 8, .systemYellow)
        nextButtonOutlet.roundCorner(1, 8, .systemYellow)
        popUpButtonOutlet.roundCorner(1, 8, .systemYellow)
        subsTypeView.dataArray = subListType
    }
    
    @IBAction func realPersonClicked(_ sender: UIButton) {
        if (!sender.isSelected) {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "circle.fill"), for: .selected)
            sender.tintColor = .systemYellow
            sender.titleLabel?.tintColor = .black
            privButtonOutlet.setImage(UIImage(systemName: "circle"), for: .normal)
            privButtonOutlet.isSelected = false
        }
    }
    @IBAction func privPersonClicked(_ sender: UIButton) {
        if (!sender.isSelected) {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "circle.fill"), for: .selected)
            sender.tintColor = .systemYellow
            sender.titleLabel?.tintColor = .black
            realButtonOutlet.setImage(UIImage(systemName: "circle"), for: .normal)
            realButtonOutlet.isSelected = false
        }
    }
    @IBAction func infoViewClicked(_ sender: UIButton) {
        popUpView.isHidden = !popUpView.isHidden
    }
    
    @IBAction func popUpButtonClicked(_ sender: UIButton) {
        popUpView.isHidden = !popUpView.isHidden
    }
    @IBAction func backButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
