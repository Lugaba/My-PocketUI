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
    var userContent = [String]()
    var numberOfContent = 2
    var search = [String]()

    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userContentSaved = UserDefaults.standard.stringArray(forKey: "userContent") {
            userContent = userContentSaved
        }
        
        title = "Swift"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLine))
        addButton.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        navigationItem.rightBarButtonItems = [addButton]
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        search = userContent + contentItems
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        tableView.addGestureRecognizer(longPress)
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
            userContent.insert(newContent, at: 0)
            search = userContent + contentItems
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.setValue(userContent, forKey: "userContent")
        } else {
            let ac = UIAlertController(title: "Nome vazio", message: "Crie um nome para a documentação da maneira correta", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true)
        }
    }
    
    // MARK: - SearchBar functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search.removeAll()
        if searchText.isEmpty {
            search = userContent + contentItems
        } else {
            for item in userContent {
                if item.lowercased().contains(searchText.lowercased()) {
                    search.append(item)
                }
            }
            for item in contentItems {
                if item.lowercased().contains(searchText.lowercased()) {
                    search.append(item)
                }
            }
        }
        
        tableView.reloadData()
    }
    
    /// Reinicia o filtro quando inicia a edicao da searchBar
    /// - Parameter searchBar: searchBar criada
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        search = userContent + contentItems
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = userContent + contentItems
        tableView.reloadData()
    }
    
    // MARK: - Delete content (LongGesture)
    
    /// Recebe um longPressGesture e inicia o processo de deleçao de um conteudo adicionado pelo usuário
    /// - Parameter sender: Linha da tableView que foi pressionada por um tempo (LongPressGesture)
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                if userContent.contains(search[indexPath.row]) { // arrumar condicao
                    let ac = UIAlertController(title: "Deletar a documentação '\(userContent[indexPath.row])'", message: nil, preferredStyle: .actionSheet)
                    ac.addAction(UIAlertAction(title: "Confirmar", style: .destructive, handler: {
                        [weak self] action in
                        self?.userContent.remove(at: indexPath.row)
                        guard let listaNovas = self?.userContent else {return}
                        self?.search = listaNovas + self!.contentItems
                        self?.tableView.reloadData()
                        UserDefaults.standard.setValue(self?.userContent, forKey: "userContent")
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
        return search.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = search[indexPath.row]
        return cell
    }

}
