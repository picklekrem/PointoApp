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
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
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
    
    
    @IBInspectable var cornerRadius: CGFloat {
           get {
               return self.layer.cornerRadius
           }
           set {
               self.layer.cornerRadius = newValue
                setNeedsDisplay()
           }
       }
    
    @IBInspectable var borderWidth: CGFloat {
           get {
               return self.layer.borderWidth
           }
           set {
               self.layer.borderWidth = newValue
                setNeedsDisplay()
           }
       }
    @IBInspectable var borderColor: UIColor {
           get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.white.cgColor)
           }
           set {
            self.layer.borderColor = newValue.cgColor
            setNeedsDisplay()
           }
       }
    var position: Position {
        set{
            switch newValue {
            case .left:
                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                break

            case .down:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
                break

            case .right:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                break

            case .up:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                break
            }
        }
        get{
            if(self.transform == CGAffineTransform(rotationAngle: -CGFloat.pi/2)){
                return .left
            }else if(self.transform == CGAffineTransform(rotationAngle: CGFloat.pi*2)){
                return .down
            }else if(self.transform == CGAffineTransform(rotationAngle: CGFloat.pi/2)){
                return .right
            }else {
                return .up
            }
        }
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
 
    func showKeyboard(completion: @escaping (_ keyboardRectangle: CGRect) -> ()) {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
            if self.isFirstResponder{
                let userInfo:NSDictionary = notification.userInfo! as NSDictionary
                let keyboardFrame:NSValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
                
                completion(keyboardFrame.cgRectValue)
            }
        }
    }
    
    func hideKeyboard(completion: @escaping (_ hide: Bool) -> ()) {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (notification) in
            if self.isFirstResponder{
                completion(true)
            }
        }
    }
    
    public func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
enum BorderLocation {
    case left
    case bottom
    case right
    case top
}

enum Position {
    case left
    case down
    case right
    case up
}
