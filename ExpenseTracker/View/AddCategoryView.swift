//
//  AddCategoryView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/6.
//

import SwiftUI

struct AddCategoryView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State var isAddCategoryViewPresented: Bool = false
    @State var categories: [Category] = []
    @State var categoryTitle: String = ""
    @State var typeSelection: Int = 0
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select the type", selection: $typeSelection){
                        Text("Expense").tag(0)
                        Text("Deposit").tag(1)
                        Text("Investment").tag(2)
                    }
                    .pickerStyle(.segmented)
                    TextField("Category title", text: $categoryTitle)
                }
            }
            .navigationTitle("New Category")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        addCategory()
                        dismiss()
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
    
    func addCategory(){
        let category = Category(name: categoryTitle, type: typeSelection)
        context.insert(category)
    }
}

#Preview {
    AddCategoryView()
}
