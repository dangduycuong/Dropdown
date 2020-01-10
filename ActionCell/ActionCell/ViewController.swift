//
//  ViewController.swift
//  ActionCell
//
//  Created by Đặng Duy Cường on 10/25/19.
//  Copyright © 2019 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let dropdownListTestSuite = DropDown()
    
    var age: String?
    var ages = [Int](0...15)
    var listNames = [String]()
    
    var name: String?
    
    func setName() {
        for item in ages {
            listNames.append("Name: \(item)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(MasterTableViewCell.nib(), forCellReuseIdentifier: MasterTableViewCell.identifier)
        setName()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.identifier, for: indexPath) as? MasterTableViewCell
        cell?.printButton.tag = indexPath.row
        cell?.printButton.addTarget(self, action: #selector(self.showDropDown(_:)), for: .touchUpInside)
        cell?.nameLabel.text = name ?? "N/A"
        
        cell?.middlemenName = name
        cell?.fillData()
        return cell!
    }

    // Pass data from here to sub cell
    @objc func showDropDown(_ sender: UIButton) {
        self.age = "\(sender.tag)"
        print(sender.tag)
        
        
//        dropdownListTestSuite.dataSource = self.listTestSuite!.map({$0.name ?? ""})
        dropdownListTestSuite.dataSource = listNames
        dropdownListTestSuite.direction = .bottom
        dropdownListTestSuite.textFont = Constant.font.robotoRegular(ofSize: 15)
        dropdownListTestSuite.anchorView = sender
        dropdownListTestSuite.bottomOffset = CGPoint(x: 0, y: sender.bounds.size.height)
        dropdownListTestSuite.width = UIScreen.main.bounds.width - 16
        
        dropdownListTestSuite.selectionAction = { (index, item) in
            sender.setTitle(item, for: .normal)
            self.name = item
            self.tableView.reloadData()
        }
        dropdownListTestSuite.show()
    }
}

