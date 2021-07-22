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
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        return v
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        loadText()
        
        title = documentacao.title
        
        if elementos.isEmpty{
            editText()
        } else {
            let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editText))
            let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareContent))
            
            navigationItem.rightBarButtonItems = [shareButton, editButton]
            
            // add the scroll view to self.view
            self.view.addSubview(scrollView)
            
            // constrain the scroll view to 8-pts on each side
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            
            for i in elementos {
                if i.hasPrefix("*||*"){
                    let newCode = i.replacingOccurrences(of: "*||*", with: "")
                    let elemento = UITextView()
                    elemento.translatesAutoresizingMaskIntoConstraints = false
                    elemento.text = newCode
                    elemento.textColor = .black
                    elemento.backgroundColor = .lightGray
                    elemento.layer.cornerRadius = 10
                    elemento.isEditable = false
                    elemento.isScrollEnabled = false
                    scrollView.addSubview(elemento)
                    views.append(elemento)
                } else {
                    let elemento = UILabel()
                    elemento.translatesAutoresizingMaskIntoConstraints = false
                    elemento.text = i
                    elemento.numberOfLines = 0
                    elemento.textColor = .black
                    scrollView.addSubview(elemento)
                    views.append(elemento)
                    
                }
            }
            
            for i in 0..<views.count {
                if i == 0 {
                    NSLayoutConstraint.activate([
                        views[i].widthAnchor.constraint(equalToConstant: 338),
                        views[i].topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
                        views[i].leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                        views[i].trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
                    ])
                } else if i == views.count-1 {
                    NSLayoutConstraint.activate([
                        views[i].topAnchor.constraint(equalTo: views[i-1].bottomAnchor, constant: 20),
                        views[i].leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                        views[i].trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                        views[i].bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16.0)

                    ])
                }else {
                    NSLayoutConstraint.activate([
                        views[i].topAnchor.constraint(equalTo: views[i-1].bottomAnchor, constant: 20),
                        views[i].leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                        views[i].trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
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
    
    @objc func editText() {
        
        for i in views {
            i.removeFromSuperview()
        }
        views.removeAll()
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelEdit))
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveText))
        saveButton.tintColor = UIColor(red: 0.38, green: 0.66, blue: 0.85, alpha: 1.00)
        navigationItem.rightBarButtonItems = [saveButton, cancelButton]
        
        
        addTexto.translatesAutoresizingMaskIntoConstraints = false
        addTexto.textColor = .black
        addTexto.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        addTexto.text = documentacao.information
        view.addSubview(addTexto)
        
        NSLayoutConstraint.activate([
            addTexto.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            addTexto.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            addTexto.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            addTexto.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
        
    }
    
    @objc func cancelEdit() {
        loadView()
    }
    
    @objc func shareContent() {
        let vc = UIActivityViewController(activityItems: elementos, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
