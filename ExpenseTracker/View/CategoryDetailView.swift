//
//  CategoryDetailView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/13.
//

import SwiftUI
import SwiftData

struct CategoryDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isEditing: Bool = false
    @State private var editedName: String
    @State private var editedType: Int
    
    var category: Category
    
    init(category: Category) {
            self.category = category
            self._editedName = State(initialValue: category.name)
            self._editedType = State(initialValue: category.type)
        }
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Name")){
                    if isEditing {
                        TextField("Name", text: $editedName)
                    } else{
                        Text(category.name)
                    }
                }
                Section(header: Text("Type")){
                    if isEditing {
                        Picker("Select the type", selection: $editedType){
                            Text("Expense").tag(0)
                            Text("Deposit").tag(1)
                            Text("Investment").tag(2)
                        }
                        .pickerStyle(.menu)
                    } else{
                        Text(getTypeName(type: category.type))
                    }
                }
                Section(header: Text("Date Created")){
                    Text(category.dateCreated.formatted(date: .long, time: .shortened))
                        .font(.footnote)
                }
            }
            .navigationTitle(category.name)
            .toolbar{
                ToolbarItem{
                    Button{
                        if isEditing{
                            category.name = editedName
                            category.type = editedType
                            isEditing = false
                            presentationMode.wrappedValue.dismiss()
                        } else{
                            isEditing = true
                        }
                    } label: { Text(isEditing ? "Save" : "Edit") }
                }
            }
            
        }
        
    }
}

//#Preview {
//    CategoryDetailView()
//}
