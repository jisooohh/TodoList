//
//  CalendarViewModel.swift
//  SoodoList
//
//  Created by 홍지수 on 6/26/24.
//

import Foundation
import Combine

class CalendarViewModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    @Published var todoItems: [TodoItem] = []
    
    private var homeViewModel: HomeViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        
        $selectedDate
            .sink { [weak self] date in
                self?.updateTodoItems(for: date)
            }
            .store(in: &cancellables)
    }
    
    func updateTodoItems(for date: Date) {
        todoItems = homeViewModel.todoItems(for: date)
    }
}
