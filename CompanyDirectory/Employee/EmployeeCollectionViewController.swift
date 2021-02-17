//
//  EmployeeCollectionViewController.swift
//  CompanyDirectory
//
//  Created by 大林拓実 on 2021/02/17.
//

import UIKit

class EmployeeCollectionViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    let employees: [Employee] = [Employee(name: "野坂雄介", status: .online, contactAddress: "090-1234-5678", teamType: .engineering),
                                Employee(name: "横田龍之介", status: .online, contactAddress: "090-1111-2222", teamType: .design),
                                Employee(name: "城之内恵美", status: .online, contactAddress: "090-2222-3333", teamType: .design),
                                Employee(name: "西村里枝", status: .online, contactAddress: "090-4444-5555", teamType: .finance),]
    var detailEmployee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEmployeeDetail" {
            let vc = segue.destination as! EmployeeDetailViewController
            vc.employee = detailEmployee
        }
        
    }
    
}

extension EmployeeCollectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        cell.imageView?.image = UIImage(systemName: "person.circle")
        cell.textLabel?.text = employees[indexPath.row].name
        cell.detailTextLabel?.text = employees[indexPath.row].teamType.rawValue
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailEmployee = employees[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toEmployeeDetail", sender: nil)
    }
    
}
