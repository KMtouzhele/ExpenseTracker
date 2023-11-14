//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/3.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        TabView{
            TransactionView()
                .tabItem{
                    Label(
                        title: { Text("Transaction") },
                        icon: { Image(systemName: "menucard.fill") }
                    )
                }
                .tag(0)
            CategoryView()
                .tabItem{
                    Label(
                        title: { Text("Category") },
                        icon: { Image(systemName: "list.bullet") }
                    )
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label(
                        title: { Text("Setting") },
                        icon: { Image(systemName: "gear")}
                    )
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
