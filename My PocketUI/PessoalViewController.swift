//
//  PessoalViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 21/07/21.
//

import UIKit

var pessoalContents = [Content]()

class PessoalViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    let searchController = UISearchController(searchResultsController: nil)
    var search = [Content]()

    @IBOutlet weak var pessoalCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        search = pessoalContents
        
        title = "Pessoal"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLine))
        addButton.tintColor = UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00)
        navigationItem.rightBarButtonItems = [addButton]
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        pessoalCollection.addGestureRecognizer(longPress)
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Add new item function
    
    @objc func addLine() {
        let ac = UIAlertController(title: "Adicionar nova documentação", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let Action = UIAlertAction(title: "Criar", style: .default) {
            [weak self, weak ac] _ in
            guard let newContent = ac?.textFields?[0].text else {return}
            self?.addLineCollectionView(newContent: newContent)
        }

        ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        ac.addAction(Action)

        present(ac, animated: true)
    }
    
    /// Adiciona uma nova linha na TAbleView de acordo com o input do usuário, caso esteja vazio libera um alerta
    /// - Parameter newContent: String que o usuário escreveu no alerta
    @objc func addLineCollectionView(newContent: String) {
        if newContent.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            pessoalContents.insert(Content.init(name: newContent), at: 0)
            search = pessoalContents
            let indexPath = IndexPath(row: 0, section: 0)
            pessoalCollection.insertItems(at: [indexPath])
            //UserDefaults.standard.setValue(search[topic].contents[content].listUser, forKey: saveKeys[topic][content])
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
            search = pessoalContents
        } else {
            for item in pessoalContents {
                if item.name.lowercased().contains(searchText.lowercased()) {
                    search.append(item)
                }
            }
        }
        pessoalCollection.reloadData()
    }
    
    /// Reinicia o filtro quando inicia a edicao da searchBar
    /// - Parameter searchBar: searchBar criada
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        search = pessoalContents
        pessoalCollection.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = pessoalContents
        pessoalCollection.reloadData()
    }
    
    // MARK: - Delete content (LongGesture)
    
    /// Recebe um longPressGesture e inicia o processo de deleçao de um conteudo adicionado pelo usuário
    /// - Parameter sender: Linha da tableView que foi pressionada por um tempo (LongPressGesture)
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: pessoalCollection)
            if let indexPath = pessoalCollection.indexPathForItem(at: touchPoint) {
                let ac = UIAlertController(title: "Deletar a documentação '\(pessoalContents[indexPath.row].name)'", message: nil, preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "Confirmar", style: .destructive, handler: {
                    [weak self] action in
                    
                    pessoalContents.remove(at: indexPath.row)
                    self?.search = pessoalContents
                    
                    self?.pessoalCollection.reloadData()
                }))
                ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                present(ac, animated: true)
            }
        }
    }
    
    // MARK: - Collection functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return search.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PessoalCell", for: indexPath) as! PessoalCollectionViewCell
        cell.name.text = search[indexPath.item].name
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "listOfContent") as? SwiftTableViewController {
            vc.topic = 4
            vc.content = indexPath.item
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
