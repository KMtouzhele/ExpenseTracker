//
//  Item.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/3.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
