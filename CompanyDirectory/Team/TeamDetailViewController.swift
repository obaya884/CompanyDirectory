//
//  TeamDetailViewController.swift
//  CompanyDirectory
//
//  Created by 大林拓実 on 2021/02/17.
//

import UIKit

class TeamDetailViewController: UIViewController {
    var team: Team?
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imageView.image = UIImage(systemName: "person.circle")
        nameLabel.text = team?.name
        descriptionLabel.text = team?.description
    }
    
}

extension TeamDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Text"
        return cell
    }
    
    
}
