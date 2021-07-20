//
//  Content.swift
//  My PocketUI
//
//  Created by Luca Hummel on 20/07/21.
//

import Foundation

class Content {
    var listContent = [String]()
    var listUser = [String]()
    var listSearch = [String]()
    
    init(listContent: [String]) {
        self.listContent = listContent
        listSearch = self.listSearch + self.listContent
    }
}
