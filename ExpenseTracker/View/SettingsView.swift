//
//  SettingsView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/7.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Finance")){
                    NavigationLink(destination: CurrencySetting()){
                        Text("Currency")
                    }
                }
                Section(header: Text("General")){
                    Text("Display mode")
                }
                }
                
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
