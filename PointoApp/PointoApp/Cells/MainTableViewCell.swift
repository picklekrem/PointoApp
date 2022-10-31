//
//  MainTableViewCell.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 29.10.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let identifier = "MainTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        backView.roundCorner(1,8,.lightGray)
    }
    
    func loadData (data : ResultObjects) {
        mainLabel.text = data.value
        mainImageView.image = image(for: data.key!)
    }
    
    func image(for value: Int) -> UIImage {
        switch value {
        case 1:
            return UIImage(named: "subs_icon.png")!
        case 2:
            return UIImage(named: "doc_icon.png")!
        case 4:
            return UIImage(named: "tahliye_icon.png")!
        case 5 :
            return UIImage(named: "rating_icon.png")!
        default:
            return UIImage(systemName: "person.crop.circle")!
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


