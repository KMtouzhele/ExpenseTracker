//
//  AddCurrencyView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/7.
//

import SwiftUI

struct AddCurrencyView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State var typeSelection: Int = 0
    @State var currencyName: String = ""
    var body: some View {
        NavigationStack{
            Form{
                Picker("Select the type", selection: $typeSelection){
                    Text("Currency").tag(0)
                    Text("Crypto").tag(1)
                }
                .pickerStyle(.segmented)
                
                HStack{
                    Text("Name")
                    TextField("e.g. AUD", text: $currencyName)
                }
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                        addCurrency()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Currency")
        }
    }
    func addCurrency(){
        let newCurrency = CurrencyType(name: currencyName, type: typeSelection)
        context.insert(newCurrency)
    }
}

#Preview {
    AddCurrencyView()
}
