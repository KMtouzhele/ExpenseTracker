//
//  TransactionView.swift
//  ExpenseTracker
//
//  Created by Kilmer Li on 2023/11/6.
//

import SwiftUI
import SwiftData

struct TransactionView: View {
    @Environment(\.modelContext) private var context
    @Query private var transactions: [Transaction]
    @Query private var categories: [Category]
    
    @State private var isSubmitViewPresented: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(transactions){ transaction in
                        NavigationLink(destination: TransactionDetailView(transaction: transaction)){
                            HStack{
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(transaction.title)
                                            .bold()
                                        Text(transaction.category)
                                            .font(.footnote)
                                    }
                                    Text(transaction.date.formatted(date: .complete, time: .omitted))
                                        .font(.footnote)
                                }
                                Spacer()
                                VStack(alignment: .trailing){
                                    Text(transaction.currency)
                                        .font(.footnote)
                                    Text(transaction.amount.formatted())
                                        .font(.title)
                                        .bold()
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteTransaction)
                    
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        isSubmitViewPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isSubmitViewPresented){
                        SubmitView()
                            .presentationDetents([.medium])
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
            }
            .navigationTitle("Transaction")
        }
    }
    
    func deleteTransaction(_ indexes: IndexSet){
        for index in indexes{
            let transaction = transactions[index]
            context.delete(transaction)
        }
    }
}


#Preview {
    TransactionView()
}
