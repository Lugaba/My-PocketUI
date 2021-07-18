//
//  SwiftTableViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 18/07/21.
//

import UIKit

class SwiftTableViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    var contentItems = ["Bom dia", "Tudo bem"]
    var search = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLine))
        addButton.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        navigationItem.rightBarButtonItems = [addButton]
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        search = contentItems
        
        title = "Swift"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    @objc func addLine() {
        let ac = UIAlertController(title: "Adicionar nova documentação", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let Action = UIAlertAction(title: "Criar", style: .default) {
            [weak self, weak ac] _ in
            guard let newContent = ac?.textFields?[0].text else {return}
            self?.addLineTableView(newContent: newContent)
        }
        
        ac.addAction(Action)
        present(ac, animated: true)
    }
    
    @objc func addLineTableView(newContent: String) {
        contentItems.insert(newContent, at: 0)
        search = contentItems
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search.removeAll()
        if searchText == ""{
            search += contentItems
        } else {
            for item in contentItems {
                if item.lowercased().contains(searchText.lowercased()) {
                    search.append(item)
                }
            }
        }
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = contentItems
        tableView.reloadData()
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return search.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = contentItems[indexPath.row]
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
