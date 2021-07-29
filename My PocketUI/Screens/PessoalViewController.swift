//
//  PessoalViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 21/07/21.
//

import UIKit



class PessoalViewController: UICollectionViewController, UISearchBarDelegate {
    let searchController = UISearchController(searchResultsController: nil)
    var search = [Content]()
    var colors: [UIColor] = [UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00), UIColor(red: 0.80, green: 0.00, blue: 0.00, alpha: 1.00), UIColor(red: 0.38, green: 0.66, blue: 0.85, alpha: 1.00), UIColor(red: 0.00, green: 0.28, blue: 0.75, alpha: 1.00), UIColor(red: 0.03, green: 0.24, blue: 0.36, alpha: 1.00)]
    var contadorCor = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        
        title = "Pessoal"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLine))
        addButton.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        let infoButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .done, target: self, action: #selector(goToInfo))
        navigationItem.rightBarButtonItems = [addButton, infoButton]
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        collectionView.addGestureRecognizer(longPress)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        collectionView.reloadData()
    }
    
    func loadData() {
        search = try! CoreDataStackContent.getContents()
    }
    
    // MARK: - Add new item function
    
    @objc func addLine() {
        let ac = UIAlertController(title: "Adicionar novo conteúdo", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let Action = UIAlertAction(title: "Criar", style: .default) {
            [weak self, weak ac] _ in
            guard let name = ac?.textFields?[0].text else {return}
            self?.addLineCollectionView(name: name)
        }

        ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        ac.addAction(Action)
        present(ac, animated: true)
    }
    
    /// Adiciona uma nova linha na TAbleView de acordo com o input do usuário, caso esteja vazio libera um alerta
    /// - Parameter newContent: String que o usuário escreveu no alerta
    @objc func addLineCollectionView(name: String) {
        if name.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            _ = try! CoreDataStackContent.createContent(nome: name, textColor: "\(Int.random(in: 0...4))")
            search = try! CoreDataStackContent.getContents()
            let indexPath = IndexPath(row: search.count-1, section: 0)
            collectionView.insertItems(at: [indexPath])
        } else {
            let ac = UIAlertController(title: "Nome vazio", message: "Crie um nome para o conteúdo da maneira correta", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true)
        }
    }
    
    // MARK: - SearchBar functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search.removeAll()
        if searchText.isEmpty {
            search = try! CoreDataStackContent.getContents()
        } else {
            for item in try! CoreDataStackContent.getContents() {
                if item.nome!.lowercased().contains(searchText.lowercased()) {
                    search.append(item)
                }
            }
        }
        collectionView.reloadData()
    }
    
    /// Reinicia o filtro quando inicia a edicao da searchBar
    /// - Parameter searchBar: searchBar criada
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        search = try! CoreDataStackContent.getContents()
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = try! CoreDataStackContent.getContents()
        collectionView.reloadData()
    }
    
    // MARK: - Delete content (LongGesture)
    
    /// Recebe um longPressGesture e inicia o processo de deleçao de um conteudo adicionado pelo usuário
    /// - Parameter sender: Linha da tableView que foi pressionada por um tempo (LongPressGesture)
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: touchPoint) {
                let ac = UIAlertController(title: "Deletar todo o conteúdo de '\(search[indexPath.item].nome ?? "NONE")'", message: nil, preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "Confirmar", style: .destructive, handler: {
                    [weak self] action in
                    
                    let documentations = try! CoreDataStackDocumentation.getDocumentations()
                    for documentation in documentations {
                        guard let myContentUn = documentation.myContent else {return}
                        if myContentUn == self?.search[indexPath.item].nome {
                            try! CoreDataStackDocumentation.deleteDocumentation(documentation: documentation)
                        }
                    }
                    
                    guard let search = self?.search else {return}
                    
                    try! CoreDataStackContent.deleteContent(content: search[indexPath.row])
                    self?.search = try! CoreDataStackContent.getContents()
                    
                    self?.collectionView.reloadData()
                }))
                ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                present(ac, animated: true)
            }
        }
    }
    
    // MARK: - Collection functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return search.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PessoalCell", for: indexPath) as! PessoalCollectionViewCell
        let cor = Int(search[indexPath.item].textColor!)
        cell.name.text = search[indexPath.item].nome
        cell.name.textColor = colors[cor!]
        cell.layer.cornerRadius = 15
        contadorCor += 1
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "listOfContent") as? SwiftTableViewController {
            vc.content = search[indexPath.item].nome!
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Navigation
    
    @objc func goToInfo() {
        if let vc = storyboard?.instantiateViewController(identifier: "tableViewInfo") as? TableInfoViewController {
            vc.tag = 2
            navigationController?.present(vc, animated: true)
        }
    }

    /*
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
