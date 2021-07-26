//
//  AprenderViewController.swift
//  My PocketUI
//
//  Created by Luca Hummel on 19/07/21.
//

import UIKit

class AprenderViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var resourcesName = ["100 Days Of Swift", "Curso de Stanford", "Stack Overflow", "UIKit Fundamentals", "Hacking with Swift", "iOS & Swift Videos", "Pedro Cacique", "Swift Tutorials", "zeroeumas", "Github Luca Hummel", "Apple"]
    var resources = ["https://www.hackingwithswift.com/100", "https://www.youtube.com/watch?v=r18Bvr3Dyfg", "https://stackoverflow.com", "https://www.raywenderlich.com/16124941-uikit-fundamentals", "https://www.hackingwithswift.com", "https://www.raywenderlich.com/ios/videos", "https://www.youtube.com/c/PedroCacique/videos", "https://www.w3schools.in/swift-tutorial/", "https://www.instagram.com/zeroeumas/", "https://github.com/Lugaba?tab=repositories", "https://www.youtube.com/user/Apple/videos"]
    
    var iniciais = ["SO", "HS", "YT", "RW", "W3", "IG", "GH", ""]
    var corInicias = [UIColor(red: 0.90, green: 0.52, blue: 0.24, alpha: 1.00), UIColor(red: 0.74, green: 0.20, blue: 0.19, alpha: 1.00), UIColor(red: 0.92, green: 0.20, blue: 0.14, alpha: 1.00), UIColor(red: 0.17, green: 0.40, blue: 0.24, alpha: 1.00), UIColor(red: 0.30, green: 0.65, blue: 0.45, alpha: 1.00), UIColor(red: 0.66, green: 0.25, blue: 0.51, alpha: 1.00), UIColor(red: 0.09, green: 0.09, blue: 0.09, alpha: 1.00), UIColor(red: 0.00, green: 0.28, blue: 0.75, alpha: 1.00)]

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
        let indiceInitial = choseIniciais(index: indexPath.item)
        cell.iniciaisLabel.text = iniciais[indiceInitial]
        cell.iniciaisLabel.backgroundColor = corInicias[indiceInitial]
        cell.iniciaisLabel.textColor = .white
        cell.nameLabel.text = resourcesName[indexPath.item]
        cell.nameLabel.textColor = .black
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
    
    func choseIniciais(index: Int) -> Int {
        if resources[index].contains("stackoverflow"){
            return 0
        } else if resources[index].contains("hackingwithswift") {
            return 1
        } else if resources[index].contains("youtube") {
            return 2
        } else if resources[index].contains("raywenderlich") {
            return 3
        } else if resources[index].contains("w3schools") {
            return 4
        } else if resources[index].contains("instagram") {
            return 5
        } else if resources[index].contains("github") {
            return 6
        } else {
            return 7
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
