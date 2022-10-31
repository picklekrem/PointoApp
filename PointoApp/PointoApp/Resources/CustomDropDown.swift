//
//  CustomDropDown.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 30.10.2022.
//

import UIKit

class CustomDropdown: UIView {
    var dropDown = DropDown()
    private var hintLabel = UILabel()
    private var arrow = UIImageView()
    
    private var itemHeight:CGFloat = 24
    
    fileprivate var didSelectCompletion: (String, Int) -> () = {selectedText, index  in }
    
    
    @IBInspectable var hintText:String = ""{
        didSet{
            hintLabel.text = hintText
        }
    }
    
    var isEditable:Bool = true{
        didSet{
            dropDown.isUserInteractionEnabled = isEditable
        }
    }
    
    var dataArray = [String](){
        didSet{
            dropDown.text = dataArray[selectedIndex]
            dropDown.optionArray = dataArray
        }
    }
    
    @IBInspectable var hintColor:UIColor{
        set {
            self.hintLabel.textColor = newValue
        }
        get {
            return .black
        }
    }
    
    var selectedIndex:Int = 0
    var selectedText:String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        cornerRadius = 10
        borderWidth = 1
        borderColor = .lightGray
        addHintView()
        addDropdown()
        addArrow()
        dropDown.arrow.isHidden = true
        addGesture()
        
        
        
        dropDown.changeVisibleList { (visible) in
            self.arrow.position = visible ? .up : .down
        }
        
        dropDown.didSelect { (selectedText, index, id) in
            self.didSelectCompletion(selectedText, index)
            self.selectedIndex = index
            self.selectedText = self.dataArray[index]
        }
    }
   
    
    private func addHintView(){
        hintLabel.numberOfLines = 1
        hintLabel.font = UIFont.systemFont(ofSize: 12)
        hintLabel.textColor = hintColor
//        hintLabel.textColor = UIColor(named: "Primary1")
        hintLabel.text = hintText
        
        addSubview(hintLabel)
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: hintLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: hintLabel, attribute: .trailing, multiplier: 1, constant: 15))
        addConstraint(NSLayoutConstraint(item: hintLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 15))
        addConstraint(NSLayoutConstraint(item: hintLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 15))
    }
    
    private func addDropdown(){
        dropDown.rowBackgroundColor = .white
        dropDown.selectedRowColor = .white
        dropDown.checkMarkEnabled = false
        addSubview(dropDown)
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: dropDown, attribute: .top, relatedBy: .equal, toItem: hintLabel, attribute: .bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: dropDown, attribute: .trailing, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: dropDown, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: dropDown, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30))
    }
    
    private func addArrow(){
        arrow.tintColor = UIColor(named: "Primary1")
        arrow.image = UIImage(systemName: "chevron.up")
        addSubview(arrow)
        arrow.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: arrow, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 19))
        addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: arrow, attribute: .trailing, multiplier: 1, constant: 15))
        addConstraint(NSLayoutConstraint(item: arrow, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22))
        addConstraint(NSLayoutConstraint(item: arrow, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22))
    }
    
    @objc public func touchAction() {
        dropDown.isSelected ?  dropDown.hideList() : dropDown.showList()
    }
    
    fileprivate func addGesture (){
        addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(touchAction)))
    }
    
    public func didSelect(completion: @escaping (_ selectedText: String, _ index: Int) -> ()) {
        didSelectCompletion = completion
    }
}
