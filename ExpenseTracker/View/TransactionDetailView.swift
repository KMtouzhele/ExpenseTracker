//
//  TransactionDetailView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/13.
//

import SwiftUI
import SwiftData

struct TransactionDetailView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
    @Query private var categories: [Category]
    @Query private var currencies: [CurrencyType]
    
    @State private var editedType: Int = 0
    @State private var editedTitle: String
    @State private var editedCategory: String
    @State private var editedAmount: Double
    @State private var editedCurrency: String
    @State private var isEditing: Bool = false
    
    var transaction: Transaction
    
    init(transaction: Transaction){
        self.transaction = transaction
        self._editedTitle = State(initialValue: transaction.title)
        self._editedCategory = State(initialValue: transaction.category)
        self._editedAmount = State(initialValue: transaction.amount)
        self._editedCurrency = State(initialValue: transaction.currency)
    }
    

    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Type")){
                    if isEditing{
                        Picker("Select the type", selection: $editedType){
                            Text("Expense").tag(0)
                            Text("Deposit").tag(1)
                            Text("Investment").tag(2)
                        }
                        .pickerStyle(.segmented)
                    } else{
                        Text(getType(name: transaction.category))
                    }
                }
                
                Section(header: Text("Category")){
                    if isEditing {
                        Picker("Select a category", selection: $editedCategory){
                            ForEach(categories){ category in
                                if category.type == editedType{
                                    Text(category.name)
                                }
                            }
                        }
                    } else {
                            Text(transaction.category)
                    }
                }
                
                Section(header: Text("Currency")){
                    if isEditing {
                        Picker("Select a currency", selection: $editedCurrency){
                            ForEach(currencies){ currency in
                                Text(currency.name)
                            }
                        }
                    } else {
                        Text(transaction.currency)
                    }
                }
                
                Grid{
                    GridRow{
                        Text("Title")
                        if isEditing {
                            TextField("Title", text: $editedTitle)
                        } else {
                            Text(transaction.title)
                        }
                    }
                    .gridColumnAlignment(.leading)
                    
                    Divider()
                    
                    GridRow{
                        Text("Amount")
                        if isEditing {
                            TextField("Amount", value: $editedAmount, format: .number)
                        } else {
                            Text(transaction.amount.formatted())
                        }
                    }
                    .gridColumnAlignment(.leading)
                }

                Section(header: Text("Date")){
                    Text(transaction.date.formatted(date: .long, time: .omitted))
                }
            }
        }
        .navigationTitle(transaction.title)
        .toolbar{
            ToolbarItem{
                Button{
                    if isEditing {
                        
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        isEditing = true
                    }
                } label: {
                    Text(isEditing ? "Save" : "Edit")
                }
            }
        }
    }
    
    func getType(name: String) -> String {
        var type: String
        if let category = categories.first(where: { $0.name == name }) {
            switch(category.type){
            case 0: type = "Expense"
            case 1: type = "Deposit"
            case 2: type = "Investment"
            default: type = "No type found"
            }
            return type
        }
        type = "No type found"
        return type
    }

}
