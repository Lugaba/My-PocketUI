//
//  AppDelegate.swift
//  My PocketUI
//
//  Created by Luca Hummel on 18/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Crio a documentacao fixa -> tive que fazer isso para que atualize as infos sem precisar deletar e baixar novamente o app, eu deleto o antigo e crio toda vez que o app é inicializado com as possiveis mudanças
        for documentation in try! CoreDataStackDocumentation.getDocumentations() {
            if documentation.isEditable == false {
                try! CoreDataStackDocumentation.deleteDocumentation(documentation: documentation)
            }
        }
        for createContent in createData {
            for createDoc in createContent {
                _ = createDoc
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

