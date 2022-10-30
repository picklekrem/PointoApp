//
//  Extensions.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 29.10.2022.
//

import Foundation
import UIKit

fileprivate var selectedView : UIView?

extension UIViewController {
    func showSpinner() {
        selectedView = UIView(frame: self.view.bounds)
        selectedView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        indicator.center = selectedView!.center
        indicator.startAnimating()
        selectedView?.addSubview(indicator)
        self.view.addSubview(selectedView!)
    }
    
    func removeSpinner() {
        selectedView?.removeFromSuperview()
        selectedView = nil
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIView {
    func roundCorner (_ border : CGFloat, _ cornerRadius : CGFloat, _ color : UIColor ) {
        let cgColor = color.cgColor
        self.layer.borderWidth = border
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = cgColor
    }
}
