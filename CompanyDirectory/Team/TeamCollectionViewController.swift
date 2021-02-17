//
//  TeamCollectionViewController.swift
//  CompanyDirectory
//
//  Created by 大林拓実 on 2021/02/17.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
}

class TeamCollectionViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    let teams: [Team] = [Team(name: TeamType.finance.rawValue, description: "", members: [], teamType: .finance),
                         Team(name: TeamType.engineering.rawValue, description: "", members: [], teamType: .engineering),
                         Team(name: TeamType.design.rawValue, description: "", members: [], teamType: .design),
                         Team(name: TeamType.matketing.rawValue, description: "", members: [], teamType: .matketing),
                         Team(name: TeamType.legal.rawValue, description: "", members: [], teamType: .legal),
                         Team(name: TeamType.humanResources.rawValue, description: "", members: [], teamType: .humanResources)]
    var detailTeam: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTeamDetail" {
            let vc = segue.destination as! TeamDetailViewController
            vc.team = detailTeam
        }
    }
    
}

extension TeamCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TeamCollectionViewCell
        cell.imageView.image = UIImage(systemName: "person.circle")
        cell.nameLabel.text = teams[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailTeam = teams[indexPath.row]
        performSegue(withIdentifier: "toTeamDetail", sender: nil)

    }
}

