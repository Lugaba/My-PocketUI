//
//  AprenderViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 19/07/21.
//

import UIKit

class AprenderViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var resourcesName = ["100 Days Of Swift", "Stack Overflow"]
    var resources = ["https://www.hackingwithswift.com/100", "https://stackoverflow.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        title = "Aprender mais"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
    // MARK: - ColletionView functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LinkCell", for: indexPath) as! ResourceCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.backgroundColor = .white
        cell.nameLabel.text = resourcesName[indexPath.item]
        cell.linkLabel.text = resources[indexPath.item]
        cell.linkLabel.font = .systemFont(ofSize: 12)
        cell.linkLabel.textColor = UIColor(red: 0.42, green: 0.42, blue: 0.42, alpha: 1.00)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Web") as? WebViewController {
            vc.urlString = resources[indexPath.item]
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
