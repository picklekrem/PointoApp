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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    func configureUI () {
        firstSectionView.roundCorner(1,8,.lightGray)
        secondSectionView.roundCorner(1,8,.lightGray)
        popUpView.roundCorner(1, 8, .systemYellow)
        nextButtonOutlet.roundCorner(1, 8, .systemYellow)
        popUpButtonOutlet.roundCorner(1, 8, .systemYellow)
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
