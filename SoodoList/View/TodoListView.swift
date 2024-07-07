//
//  TodoListView.swift
//  SoodoList
//
//  Created by 홍지수 on 6/25/24.
//

import SwiftUI

struct TodoListView: View {
    @Binding var todoItems: [TodoItem]
    
    var body: some View {
        List {
            ForEach($todoItems) { $item in
                VStack(alignment: .leading) {
                    TextField("할 일", text: $item.title)
                    DatePicker("시간", selection: $item.time, displayedComponents: .hourAndMinute)
                }
                .padding(.vertical, 4)
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Todo List")
    }
    
    func deleteItems(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
    }
}
