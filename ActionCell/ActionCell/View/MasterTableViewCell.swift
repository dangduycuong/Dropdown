//
//  MasterTableViewCell.swift
//  ActionCell
//
//  Created by Đặng Duy Cường on 10/25/19.
//  Copyright © 2019 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var printButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var subTableView: UITableView!
    
    var numbers = [Int](0...5)
    var listNames: [String]?
    
    var middlemenName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subTableView.register(SubTableViewCell.nib(), forCellReuseIdentifier: SubTableViewCell.identifier)
        subTableView.delegate = self
        subTableView.dataSource = self
    }
    
    override func layoutSubviews() {
        subTableView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubTableViewCell.identifier, for: indexPath) as! SubTableViewCell
        cell.nameLabel.text = middlemenName ?? "N/A"
        cell.temp = middlemenName
        return cell
    }
    
    static func nib() -> UINib {
        return UINib(nibName: MasterTableViewCell.identifier, bundle: nil)
    }
    
    func fillData() {
//        tableView.reloadData()
    }
    
    static var identifier: String {
        return "MasterTableViewCell"
    }
}
