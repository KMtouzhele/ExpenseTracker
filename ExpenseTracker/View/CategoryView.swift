//
//  CategorySubmitView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/3.
//

import SwiftUI
import SwiftData

struct CategoryView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var categories: [Category]
    
    @State private var isAddCategoryViewPresented: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(categories){ category in
                        NavigationLink(destination: CategoryDetailView(category: category)){
                            VStack(alignment: .leading){
                                Text(category.name)
                                    .bold()
                                Text(getTypeName(type:category.type))
                                    .font(.footnote)
                                Text(category.dateCreated.formatted(date: .long, time: .shortened))
                                    .font(.footnote)
                            }
                        }
                    }
                    .onDelete(perform: deleteCatagory)
                }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            isAddCategoryViewPresented = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isAddCategoryViewPresented){
                            AddCategoryView()
                                .presentationDetents([.medium])
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        EditButton()
                    }
                }
                .navigationTitle("Category")
            }
        }
    }
    
    func deleteCatagory(_ indexes: IndexSet){
        for index in indexes{
            let category = categories[index]
            context.delete(category)
        }
    }
    
    func getTypeName(type: Int) -> String {
        var typeName: String
        switch type{
        case 0: typeName = "Expense"
        case 1: typeName = "Deposit"
        case 2: typeName = "Investment"
        default: typeName = "Expense"
        }
        return typeName
    }
}

#Preview {
    CategoryView()
}
