//
//  RoutineDetailView.swift
//  SoodoList
//
//  Created by 홍지수 on 6/27/24.
//

import SwiftUI

struct RoutineDetailView: View {
    //@StateObject var viewModel: RoutineViewModel
    @Binding var detailItems: [TodoItem]
    
    var body: some View {
        List {
            //let detailItems = $viewModel.RoutineItems
            ForEach($detailItems) { $item in
                VStack(alignment: .leading) {
                    TextField("할 일", text: $item.title)
                    DatePicker("시간", selection: $item.time, displayedComponents: .hourAndMinute)
                }
                .padding(.vertical, 4)
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(InsetGroupedListStyle())
    }
    
    func deleteItems(at offsets: IndexSet) {
        //viewModel.RoutineItems.remove(atOffsets: offsets)
        detailItems.remove(atOffsets: offsets)
    }
}
