//
//  ViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 18/07/21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
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

}

