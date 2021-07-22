//
//  SwiftTableViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 18/07/21.
//

import UIKit

class SwiftTableViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    var userContent = [String]()
    var numberOfContent = 2
    var tableContent = [Documentation]()
    var search = [Documentation]()
    
    var topic: Int = 3
    var content: String = "Swift"

    

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        
        
        title = content
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLine))
        addButton.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        navigationItem.rightBarButtonItems = [addButton]
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        tableView.addGestureRecognizer(longPress)
    }
    
//    func createData() {
//        search = [Topic.init(contents: barsContents), Topic.init(contents: viewsContents), Topic.init(contents: controlsContent), Topic.init(contents: swiftContents), Topic.init(contents: pessoalContents)]
//    }
    
    func loadData() {
        let documentations = try! CoreDataStackDocumentation.getDocumentations()
        for documentation in documentations {
            guard let myContentUn = documentation.myContent else {return}
            if myContentUn == content {
                tableContent.append(documentation)
            }
        }
        search = tableContent
    }
    
    // MARK: - Add new item function
    
    @objc func addLine() {
        let ac = UIAlertController(title: "Adicionar nova documentação", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let Action = UIAlertAction(title: "Criar", style: .default) {
            [weak self, weak ac] _ in
            guard let newDocumentationTitle = ac?.textFields?[0].text else {return}
            self?.addLineTableView(newDocumentationTitle: newDocumentationTitle)
        }

        ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        ac.addAction(Action)

        present(ac, animated: true)
    }
    
    /// Adiciona uma nova linha na TAbleView de acordo com o input do usuário, caso esteja vazio libera um alerta
    /// - Parameter newContent: String que o usuário escreveu no alerta
    @objc func addLineTableView(newDocumentationTitle: String) {
        if newDocumentationTitle.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            let newDocumentation = try! CoreDataStackDocumentation.createDocumentation(title: newDocumentationTitle, information: "", isEditable: true, myContent: content)
            tableContent.insert(newDocumentation, at: 0)
            search = tableContent
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            try! CoreDataStackDocumentation.saveContext()
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
            search = tableContent
        } else {
            for item in tableContent {
                if item.title!.lowercased().contains(searchText.lowercased()) {
                    search.append(item)
                }
            }
        }
        tableView.reloadData()
    }

    /// Reinicia o filtro quando inicia a edicao da searchBar
    /// - Parameter searchBar: searchBar criada
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        search = tableContent
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = tableContent
        tableView.reloadData()
    }
    
    // MARK: - Delete content (LongGesture)
    
    /// Recebe um longPressGesture e inicia o processo de deleçao de um conteudo adicionado pelo usuário
    /// - Parameter sender: Linha da tableView que foi pressionada por um tempo (LongPressGesture)
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                for documentation in search {
                    if documentation.isEditable == true { // arrumar condicao
                        let ac = UIAlertController(title: "Deletar a documentação '\(documentation.title ?? "NONE")'", message: nil, preferredStyle: .actionSheet)
                        ac.addAction(UIAlertAction(title: "Confirmar", style: .destructive, handler: {
                            [weak self] action in
                            
                            
                            guard let tableContentUn = self?.tableContent else {return}
                            
                            try! CoreDataStackDocumentation.deleteDocumentation(documentation: tableContentUn[indexPath.row])
                            self?.tableContent.remove(at: indexPath.row)
                            
                            guard let tableContentUnMod = self?.tableContent else {return}
                            
                            self?.search = tableContentUnMod
                            self?.tableView.reloadData()
                        }))
                        ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                        present(ac, animated: true)
                    }
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
        cell.textLabel?.text = search[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "ContentScreen") as? ContentViewController {
            vc.documentacao = search[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
