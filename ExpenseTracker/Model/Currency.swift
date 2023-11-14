//
//  Currency.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/7.
//

import Foundation
import SwiftData

@Model
class CurrencyType: Identifiable {
    var id: String
    var name: String
    var dateCreated: Date
    //0: Traditional currency.
    //1: Cryptocurrency
    var type: Int
    
    init(name: String, type: Int) {
        self.id = UUID().uuidString
        self.name = name
        self.type = type
        self.dateCreated = .now
    }
}
