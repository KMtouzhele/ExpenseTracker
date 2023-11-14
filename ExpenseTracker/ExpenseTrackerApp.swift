//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/3.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Category.self, Transaction.self, CurrencyType.self])
    }
}
