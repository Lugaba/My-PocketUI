//
//  ViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 18/07/21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var barsCollection: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        title = "UIKit"
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == barsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarsCell", for: indexPath) as! BarCollectionViewCell
            cell.imagem.image = UIImage(named: "navigation")
            cell.layer.cornerRadius = 15
            cell.imagem.contentMode = .scaleAspectFill
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewsCell", for: indexPath) as! ViewCollectionViewCell
            cell.layer.cornerRadius = 15
            cell.imagem.image = UIImage(named: "table")
            cell.imagem.contentMode = .scaleAspectFill
            return cell
        }
        
    }

}

