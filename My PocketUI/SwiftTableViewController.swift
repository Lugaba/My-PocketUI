//
//  SwiftTableViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 18/07/21.
//

import UIKit

class SwiftTableViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let saveKeys: [[String]] = [["Navigation Bars", "Search Bars", "Sidebars", "Status Bars", "Tab Bars", "Toolbars"], ["Action Sheets", "Activity Views", "Alerts", "Collections", "Image Views", "Pages", "Popovers", "Scroll Views", "Split Views", "Tables", "Text Views", "Web Views"], ["Buttons", "Color Wells", "Context Menus", "Edit Menus", "Labels", "Page Controls", "Pickers", "Progress Indicators", "Pull-Down Menus", "Refresh Content Controls", "Segmented Controls", "Sliders", "Steppers", "Switches", "Text Fields"], ["Swift"]]
    var userContent = [String]()
    var numberOfContent = 2
    var search = [Topic]()
    
    var topic = 3
    var content = 0

    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createData()
        
        if let userContentSaved = UserDefaults.standard.stringArray(forKey: saveKeys[topic][content]) {
            print(userContentSaved)
            search[topic].contents[content].listUser = userContentSaved
        }
        
        search[topic].contents[content].listSearch = search[topic].contents[content].listUser + search[topic].contents[content].listContent
        
        
        title = "Swift"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLine))
        addButton.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        navigationItem.rightBarButtonItems = [addButton]
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        tableView.addGestureRecognizer(longPress)
    }
    
    func createData() {
        search = [Topic.init(contents: barsContents), Topic.init(contents: viewsContents), Topic.init(contents: controlsContent), Topic.init(contents: swiftContents)]
    }

    
    // MARK: - Add new item function
    
    @objc func addLine() {
        let ac = UIAlertController(title: "Adicionar nova documentação", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let Action = UIAlertAction(title: "Criar", style: .default) {
            [weak self, weak ac] _ in
            guard let newContent = ac?.textFields?[0].text else {return}
            self?.addLineTableView(newContent: newContent)
        }

        ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        ac.addAction(Action)

        present(ac, animated: true)
    }
    
    /// Adiciona uma nova linha na TAbleView de acordo com o input do usuário, caso esteja vazio libera um alerta
    /// - Parameter newContent: String que o usuário escreveu no alerta
    @objc func addLineTableView(newContent: String) {
        if newContent.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            search[topic].contents[content].listUser.insert(newContent, at: 0)
            search[topic].contents[content].listSearch = search[topic].contents[content].listUser + search[topic].contents[content].listContent
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.setValue(search[topic].contents[content].listUser, forKey: saveKeys[topic][content])
        } else {
            let ac = UIAlertController(title: "Nome vazio", message: "Crie um nome para a documentação da maneira correta", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true)
        }
    }
    
    // MARK: - SearchBar functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search[topic].contents[content].listSearch.removeAll()
        if searchText.isEmpty {
            search[topic].contents[content].listSearch = search[topic].contents[content].listUser + search[topic].contents[content].listContent
        } else {
            for item in search[topic].contents[content].listUser {
                if item.lowercased().contains(searchText.lowercased()) {
                    search[topic].contents[content].listSearch.append(item)
                }
            }
            for item in search[topic].contents[content].listContent {
                print(item)
                if item.lowercased().contains(searchText.lowercased()) {
                    print(item)
                    search[topic].contents[content].listSearch.append(item)
                }
            }
        }
        tableView.reloadData()
    }

    /// Reinicia o filtro quando inicia a edicao da searchBar
    /// - Parameter searchBar: searchBar criada
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        search[topic].contents[content].listSearch = search[topic].contents[content].listUser + search[topic].contents[content].listContent
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search[topic].contents[content].listSearch = search[topic].contents[content].listUser + search[topic].contents[content].listContent
        tableView.reloadData()
    }
    
    // MARK: - Delete content (LongGesture)
    
    /// Recebe um longPressGesture e inicia o processo de deleçao de um conteudo adicionado pelo usuário
    /// - Parameter sender: Linha da tableView que foi pressionada por um tempo (LongPressGesture)
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                if search[topic].contents[content].listUser.contains(search[topic].contents[content].listSearch[indexPath.row]) { // arrumar condicao
                    let ac = UIAlertController(title: "Deletar a documentação '\(search[topic].contents[content].listUser[indexPath.row])'", message: nil, preferredStyle: .actionSheet)
                    ac.addAction(UIAlertAction(title: "Confirmar", style: .destructive, handler: {
                        [weak self] action in
                        guard let topic = self?.topic else {return}
                        guard let content = self?.content else {return}
                        
                        self?.search[topic].contents[content].listUser.remove(at: indexPath.row)
                        
                        guard let listaNovas = self?.search[topic].contents[content].listUser else {return}
                        guard let listaContent = self?.search[topic].contents[content].listContent else {return}
                        self?.search[topic].contents[content].listSearch = listaNovas + listaContent
                        self?.tableView.reloadData()
                        
                        guard let posiciaoChave = self?.saveKeys[topic][content] else {return}
                        
                        UserDefaults.standard.setValue(self?.search[topic].contents[content].listUser, forKey: posiciaoChave)
                    }))
                    ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                    present(ac, animated: true)
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return search[topic].contents[content].listSearch.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = search[topic].contents[content].listSearch[indexPath.row]
        return cell
    }

}
