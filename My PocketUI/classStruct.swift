////
////  classStruct.swift
////  My PocketUI
////
////  Created by Luca Hummel on 20/07/21.
////
//
//import Foundation
//
//class Topic {
//    var contents = [Content]()
//    
//    init(contents: [Content]) {
//        self.contents = contents
//    }
//}
//
//
//class Content {
//    var name: String
//    var listContent = [Documentation]()
//    var listUser = [Documentation]()
//    var listSearch = [Documentation]()
//
//    init(name: String, listContent: [Documentation]) {
//        self.name = name
//        self.listContent = listContent
//        listSearch = self.listUser + self.listContent
//    }
//
//    init(name: String) {
//        self.name = name
//        self.listContent = []
//        listSearch = self.listUser + self.listContent
//    }
//}
//
//class Documentation {
//    var title: String // ["title", "information"]
//    var information: String
//
//    init(title: String, information: String) {
//        self.title = title
//        self.information = information
//    }
//
//    init(title: String){
//        self.title = title
//        self.information = ""
//    }
//}
