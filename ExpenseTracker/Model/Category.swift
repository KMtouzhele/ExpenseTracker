//
//  Category.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/3.
//

import Foundation
import SwiftData

@Model
class Category: Identifiable {
    var id: String
    @Attribute(.unique) var name: String
    var type: Int
    var dateCreated: Date
    init(name: String, type: Int) {
        self.id = UUID().uuidString
        self.name = name
        self.type = type
        self.dateCreated = .now
    }
}

func getTypeName(type: Int) -> String{
    var typeName: String = ""
    switch type {
    case 0: typeName = "Expense"
    case 1: typeName = "Deposit"
    case 2: typeName = "Investment"
    default: typeName = ""
    }
    return typeName
}
