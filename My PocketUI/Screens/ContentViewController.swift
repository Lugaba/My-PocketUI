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
        v.backgroundColor = UIColor(named: "bgColor")
        return v
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(named: "bgColor")
        loadText()
        
        title = documentacao.title
        
        navigationItem.leftBarButtonItems = []
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareContent))
        if documentacao.isEditable == true {
            let editButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(editText))
            navigationItem.rightBarButtonItems = [shareButton, editButton]
        } else {
            navigationItem.rightBarButtonItems = [shareButton]
        }
        
        
        
        if !elementos.isEmpty {
            
            // add the scroll view to self.view
            self.view.addSubview(scrollView)
            
            // constrain the scroll view to 8-pts on each side
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            
            for i in elementos {
                if i.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    if i.hasPrefix("*/"){
                        let newCode = i.replacingOccurrences(of: "*/", with: "")
                        let elemento = UITextView()
                        elemento.translatesAutoresizingMaskIntoConstraints = false
                        elemento.attributedText = formatCode(code: newCode)
                        elemento.backgroundColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
                        elemento.layer.cornerRadius = 10
                        elemento.isEditable = false
                        elemento.isScrollEnabled = false
                        scrollView.addSubview(elemento)
                        views.append(elemento)
                    } else if i.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix("https") || i.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix("Https") || i.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix("www"){
                        let elemento = UIButton()
                        elemento.translatesAutoresizingMaskIntoConstraints = false
                        elemento.setTitle(i, for: .normal)
                        elemento.titleLabel?.font = .systemFont(ofSize: 12)
                        elemento.titleLabel?.numberOfLines = 0
                        elemento.setTitleColor(UIColor(red: 0.77, green: 0.25, blue: 0.25, alpha: 1.00), for: .normal)
                        elemento.addTarget(self, action: #selector(openWeb), for: .touchUpInside)
                        scrollView.addSubview(elemento)
                        views.append(elemento)
                    } else {
                        let elemento = UILabel()
                        elemento.translatesAutoresizingMaskIntoConstraints = false
                        elemento.text = i
                        elemento.numberOfLines = 0
                        scrollView.addSubview(elemento)
                        views.append(elemento)
                        
                    }
                }
                
            }
            
            for i in 0..<views.count {
                if i == 0 {
                    NSLayoutConstraint.activate([
                        views[i].widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
                        views[i].topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
                        views[i].leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                        views[i].trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
                    ])
                } else if i == views.count-1 {
                    NSLayoutConstraint.activate([
                        views[i].topAnchor.constraint(equalTo: views[i-1].bottomAnchor, constant: 10),
                        views[i].leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
                        views[i].trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                        views[i].bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16.0)
                        
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        views[i].topAnchor.constraint(equalTo: views[i-1].bottomAnchor, constant: 10),
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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
    func loadText() {
        if documentacao?.information != "" {
            elementos = documentacao.information!.components(separatedBy: "/*")
            for i in 0..<elementos.count {
                let newText = elementos[i].components(separatedBy: "/btn")
                elementos.remove(at: i)
                for item in 0..<newText.count {
                    elementos.insert(newText[item], at: i+item)
                }
            }
        }
    }
    
    // MARK: - Edit content functions
    
    
    @objc func saveText() {
        if addTexto.text == ""{
            elementos.removeAll()
        }
        documentacao.information = addTexto.text
        try! CoreDataStackDocumentation.saveContext()
        loadView()
    }
    
    @objc func editText() {
        
        for i in views {
            i.removeFromSuperview()
        }
        views.removeAll()
        
        let infoButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(infoMarkups))
        
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelEdit))
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveText))
        saveButton.tintColor = UIColor(red: 0.38, green: 0.66, blue: 0.85, alpha: 1.00)
        navigationItem.rightBarButtonItems = [saveButton]
        navigationItem.leftBarButtonItems = [cancelButton, infoButton]
        
        
        addTexto.translatesAutoresizingMaskIntoConstraints = false
        addTexto.textColor = .black
        addTexto.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        addTexto.text = documentacao.information
        addTexto.autocapitalizationType = .none
        view.addSubview(addTexto)
        
        NSLayoutConstraint.activate([
            addTexto.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            addTexto.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            addTexto.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            addTexto.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
        
    }
    
    @objc func cancelEdit() {
        let ac = UIAlertController(title: "Tem certeza?", message: "Ao cancelar as modificações serão perdidas.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Sim", style: .destructive) {
            [weak self] _ in
            self?.loadView()
        })
        ac.addAction(UIAlertAction(title: "Voltar", style: .default))
        
        present(ac, animated: true)
    }
    
    // MARK: - Share
    
    @objc func shareContent() {
        var compartilhar = [String]()
        for texto in elementos {
            if texto.hasPrefix("*/") {
                var newTexto = texto.replacingOccurrences(of: "*/", with: "")
                newTexto += "\n"
                compartilhar.append(newTexto)
            } else {
                let newTexto = texto + "\n"
                compartilhar.append(newTexto)
            }
        }
        
        let vc = UIActivityViewController(activityItems: compartilhar, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    // MARK: - Web
    
    /// Recebe a identificao do botao que foi acionado e abre a página web com a url do botao
    /// - Parameter sender: botao acionado
    @objc func openWeb(sender: UIButton!){
        if let vc = storyboard?.instantiateViewController(identifier: "Web") as? WebViewController {
            if let site = sender.titleLabel?.text {
                vc.urlString = site
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Format Code
    
    func formatCode(code: String) -> NSMutableAttributedString {
        let palavrasVermelhas = ["var", "let ", "class", "return", "_", "func", "for ", "override", "if ", " in ", "try", "@objc", "self", "true", "false", "else", "import", "nil", "private", " as", "#selector", "super"]
        
        let palavrasAzuis = ["UIViewController", "UITableViewController", "UITableView", " Int", "IndexPath", "UITableViewCell", "UISearchBar", " String", "UICollectionViewDataSource", "UICollectionViewDelegate", "UIView", "UIButton", "NSMutableAttributedString", "NSRange", "NSRegularExpression", "UIActivityViewController", "NSLayoutConstraint", "UIImage", "UIBarButtonItem", "UIColor", "UIImageView", "UIScrollView", "UITextView", "EditingStyle", "UIAlertAction", "UILongPressGestureRecognizer", "UIAlertController", "UISearchBarDelegate", "UISearchController", "UICollectionView", "UICollectionViewCell"]
        
        let palavrasAzuisEscuro = ["present", "navigationController", "instantiateViewController", "storyboard", "pushViewController", "titleLabel", "text ", "append", "barButtonItem", "popoverPresentationController", "navigationItem", "rightBarButtonItem", "hasPrefix", "+", "+=", "replacingOccurrences", "topAnchor", "bottomAnchor", "trailingAnchor", "leadingAnchor", "rightAnchor", "leftAnchor", "constraint", "prepare", "translatesAutoresizingMaskIntoConstraints", "backgroundColor", "widthAnchor", "touchUpInside", "normal", " view", "addSubview", "isScrollEnabled", "isEditable", "title ", "navigationBar", "prefersLargeTitles", "never", "largeTitleDisplayMode", "barTintColor", "image ", "contentMode", "titleView"]
        
        let range = NSRange(location: 0, length: code.utf16.count)
        let mutableAttributedString = NSMutableAttributedString.init(string: code)
        
        for word in palavrasVermelhas {
            let regex = try? NSRegularExpression(pattern: word)
            for rangeVar in regex!.matches(in: code, range: range) {
                mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.80, green: 0.00, blue: 0.00, alpha: 1.00), range: rangeVar.range)
            }
        }
        
        for word in palavrasAzuis {
            let regex = try? NSRegularExpression(pattern: word)
            for rangeVar in regex!.matches(in: code, range: range) {
                mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.00, green: 0.28, blue: 0.75, alpha: 1.00), range: rangeVar.range)
            }
        }
        
        for word in palavrasAzuisEscuro {
            let regex = try? NSRegularExpression(pattern: word)
            if regex != nil {
                for rangeVar in regex!.matches(in: code, range: range) {
                    mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.03, green: 0.24, blue: 0.36, alpha: 1.00), range: rangeVar.range)
                }
            }
        }
        
        return mutableAttributedString
    }
    
    @objc func infoMarkups() {
        if let vc = storyboard?.instantiateViewController(identifier: "markupscreen") as? InfoViewController {
            navigationController?.present(vc, animated: true)
        }
    }
    
}
