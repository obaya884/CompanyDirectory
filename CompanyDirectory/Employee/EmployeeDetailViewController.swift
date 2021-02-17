//
//  EmployeeDetailViewController.swift
//  CompanyDirectory
//
//  Created by 大林拓実 on 2021/02/17.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    var employee: Employee?
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var onlineStatusLabel: UILabel!
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imageView.image = UIImage(systemName: "person.circle")
        nameLabel.text = employee?.name
        onlineStatusLabel.text = employee?.status.rawValue
    }
    
}

extension EmployeeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "所属チーム"
        case 1:
            return "電話番号"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        switch indexPath.section {
        case 0:
            cell.imageView?.image = UIImage(systemName: "person.circle")
            cell.textLabel?.text = employee?.teamType.rawValue
            cell.accessoryType = .disclosureIndicator
        case 1:
            cell.textLabel?.text = employee?.contactAddress
            cell.selectionStyle = .none
        default:
            break
        }
        
        return cell
    }
    
    
}
