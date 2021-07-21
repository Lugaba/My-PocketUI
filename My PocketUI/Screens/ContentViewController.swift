//
//  ContentViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 21/07/21.
//

import UIKit

class ContentViewController: UIViewController {
    var elementos = [String]()
    var views = [UIView]()
    
    var documentacao: Documentation!
    
    var addTexto = UITextView()

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        loadText()
        
        title = documentacao.title
        
        if elementos.isEmpty{
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(saveText))
            
            
            addTexto.translatesAutoresizingMaskIntoConstraints = false
            addTexto.backgroundColor = .lightGray
            view.addSubview(addTexto)
            
            NSLayoutConstraint.activate([
                addTexto.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                addTexto.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                addTexto.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                addTexto.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
            ])
        } else {
            for i in elementos {
                print(i)
                if i.hasPrefix("*||*"){
                    let newCode = i.replacingOccurrences(of: "*||*", with: "")
                    let elemento = UITextView()
                    elemento.translatesAutoresizingMaskIntoConstraints = false
                    elemento.text = newCode
                    elemento.backgroundColor = .lightGray
                    elemento.isEditable = false
                    elemento.isScrollEnabled = false
                    view.addSubview(elemento)
                    views.append(elemento)
                } else {
                    let elemento = UILabel()
                    elemento.translatesAutoresizingMaskIntoConstraints = false
                    elemento.text = i
                    elemento.numberOfLines = 0
                    view.addSubview(elemento)
                    views.append(elemento)
                    
                }
            }
            
            for i in 0..<views.count {
                if i == 0 {
                    NSLayoutConstraint.activate([
                        views[i].topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
                        views[i].leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                        views[i].trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        views[i].topAnchor.constraint(equalTo: views[i-1].bottomAnchor, constant: 20),
                        views[i].leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                        views[i].trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
                    ])
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func loadText() {
        if documentacao?.information != "" {
            elementos = documentacao.information.components(separatedBy: "\n")
            for i in 0..<elementos.count {
                let newText = elementos[i].replacingOccurrences(of: "\\n", with: "\n")
                elementos[i] = newText
            }
        }
    }
    
    @objc func saveText() {
        documentacao.information = addTexto.text
        loadView()
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
