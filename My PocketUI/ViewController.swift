//
//  ViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 18/07/21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var listContent = [["Navigation Bars", "Search Bars", "Sidebars", "Status Bars", "Tab Bars", "Toolbars"], ["Action Sheets", "Activity Views", "Alerts", "Collections", "Image Views", "Pages", "Popovers", "Scroll Views", "Split Views", "Tables", "Text Views", "Web Views"], ["Buttons", "Color Wells", "Context Menus", "Edit Menus", "Labels", "Page Controls", "Pickers", "Progress Indicators", "Pull-Down Menus", "Refresh Content Controls", "Segmented Controls", "Sliders", "Steppers", "Switches", "Text Fields"]]
    var search = [[String]]()
    
    @IBOutlet weak var barsCollection: UICollectionView!
    @IBOutlet weak var viewsCollection: UICollectionView!
    @IBOutlet weak var controlsCollection: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        search = listContent
        
        title = "UIKit"
    }

    // MARK: - SearchBar functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search[0].removeAll()
        search[1].removeAll()
        search[2].removeAll()
        if searchText.isEmpty {
            search = listContent
        } else {
            for item in listContent[0] {
                if item.lowercased().contains(searchText.lowercased()) {
                    search[0].append(item)
                }
            }
            for item in listContent[1] {
                if item.lowercased().contains(searchText.lowercased()) {
                    search[1].append(item)
                }
            }
            for item in listContent[2] {
                if item.lowercased().contains(searchText.lowercased()) {
                    search[2].append(item)
                }
            }
        }
        print(search)
        barsCollection.reloadData()
        viewsCollection.reloadData()
        controlsCollection.reloadData()
    }
    
    /// Reinicia o filtro quando inicia a edicao da searchBar
    /// - Parameter searchBar: searchBar criada
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        search = listContent
        barsCollection.reloadData()
        viewsCollection.reloadData()
        controlsCollection.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = listContent
        barsCollection.reloadData()
        viewsCollection.reloadData()
        controlsCollection.reloadData()
    }
    
    
    // MARK: - CollectionView functions

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == barsCollection {
            return search[0].count
        } else if collectionView == viewsCollection {
            return search[1].count
        } else {
            return search[2].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == barsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarsCell", for: indexPath) as! BarCollectionViewCell
            cell.imagem.image = UIImage(named: "navigation")
            cell.layer.cornerRadius = 15
            cell.imagem.contentMode = .scaleAspectFill
            return cell
        } else if collectionView == viewsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewsCell", for: indexPath) as! ViewCollectionViewCell
            cell.layer.cornerRadius = 15
            cell.imagem.image = UIImage(named: "table")
            cell.imagem.contentMode = .scaleAspectFill
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ControlCell", for: indexPath) as! ControlCollectionViewCell
            cell.layer.cornerRadius = 15
            cell.imagem.image = UIImage(named: "button")
            cell.imagem.contentMode = .scaleAspectFill
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "listOfContent") as? SwiftTableViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

