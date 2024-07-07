//
//  CalendarView.swift
//  SoodoList
//
//  Created by 홍지수 on 6/25/24.
//

import SwiftUI

struct CalendarView: View {
    @StateObject private var viewModel: CalendarViewModel
    
    init(homeViewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: CalendarViewModel(homeViewModel: homeViewModel))
    }
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            TodoListView(todoItems: $viewModel.todoItems)
                .navigationTitle("Calendar")
        }
    }
}
