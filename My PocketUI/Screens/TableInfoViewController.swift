//
//  TableInfoViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 29/07/21.
//

import UIKit

class TableInfoViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var tag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if tag == 1 {
            label1.text = "Adicione documentações próprias ao clicar no botão"
            label2.text = "Pressione ou arraste para esquerda alguma documentação própria caso deseje excluí-la"
        } else {
            label1.text = "Adicione conteúdo próprio ao clicar no botão"
            label2.text = "Pressione algum conteúdo de sua coleção caso deseje excluí-lo"
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnToTable(_ sender: Any) {
        dismiss(animated: true)
    }

}
