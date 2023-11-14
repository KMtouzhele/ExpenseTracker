//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/3.
//

import Foundation
import SwiftData

@Model
class Transaction: Identifiable {
    var id: String
    var title: String
    var category: String
    var currency: String
    var amount: Double
    var date: Date
    var createDate: Date

    
    init(title: String, category: String, currency: String, amount: Double, date: Date) {
        self.id = UUID().uuidString
        self.title = title
        self.category = category
        self.currency = currency
        self.amount = amount
        self.date = date
        self.createDate = .now
    }
    
}


