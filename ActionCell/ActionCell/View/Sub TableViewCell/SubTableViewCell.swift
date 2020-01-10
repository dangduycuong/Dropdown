//
//  SubTableViewCell.swift
//  ActionCell
//
//  Created by Đặng Duy Cường on 1/9/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class SubTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var arrayString = [String]()
    var temp: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: SubTableViewCell.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return "SubTableViewCell"
    }
    
}
