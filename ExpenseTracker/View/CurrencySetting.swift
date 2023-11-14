//
//  CurrencySetting.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/7.
//

import SwiftUI
import SwiftData

struct CurrencySetting: View {
    @Environment(\.modelContext) private var context
    @Query private var currencies: [CurrencyType]
    @State var isAddCurrencyPresented: Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(currencies){ currency in
                    Text(currency.name)
                }
                Button("Add new currency"){
                    isAddCurrencyPresented = true
                }
                .sheet(isPresented: $isAddCurrencyPresented){
                    AddCurrencyView()
                        .presentationDetents([.medium])
                }
            }
            .navigationTitle("Currency")
            
            Spacer()
        }
    }
    
    
}

#Preview {
    CurrencySetting()
}
