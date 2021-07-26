//
//  InfoViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 26/07/21.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var xButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xButton.setTitle("Cancel", for: .normal)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true)
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
