//
//  SubmitView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/3.
//

import SwiftUI
import SwiftData

struct SubmitView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Query private var categories: [Category]
    @Query private var currencies: [CurrencyType]
    
    @State var currencySelection: Int = 0
    @State var categorySelection: Int = 0
    @State var typeSelection: Int = 0
    @State var title: String = ""
    @State var amount: Double = 0.00
    @State var date: Date = .now
    
    
    var body: some View {
        NavigationView{
            Form{
                Picker("Select the type", selection: $typeSelection){
                    Text("Expense").tag(0)
                    Text("Deposit").tag(1)
                    Text("Investment").tag(2)
                }
                .pickerStyle(.segmented)
                
                HStack{
                    Text("Title")
                    TextField("e.g. Groceries", text: $title)
                }
                
                Picker("Currency", selection: $currencySelection){
                    ForEach(0..<currencies.count, id: \.self){ index in
                        Text(currencies[index].name)
                    }
                }
                
                Picker("Category", selection: $categorySelection){
                    ForEach(0..<categories.count, id: \.self){ index in
                        if categories[index].type == typeSelection{
                            Text(categories[index].name)
                        }
                    }
                }
                
                HStack{
                    Text("Amount")
                    TextField("0.00", value: $amount, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date){
                    Text("Date")
                }
            }
            .navigationTitle("New Transaction")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                        addTransaction()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addTransaction() {
        let transaction = Transaction(title: title, category: categories[categorySelection].name, currency: currencies[currencySelection].name, amount: amount, date: date)
        context.insert(transaction)
    }

}

#Preview {
    SubmitView()
}
