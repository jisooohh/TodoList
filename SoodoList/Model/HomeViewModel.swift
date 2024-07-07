//
//  ViewModel.swift
//  SoodoList
//
//  Created by 홍지수 on 6/25/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = []
    @Published var routines: [Routine] = [
        Routine(title: "Assignment", items: []),
        Routine(title: "Work Out", items: []),
        Routine(title: "Daily", items: []),
        Routine(title: "Meet", items: [])
    ]
    
    func addTodoItem() {
        let newItem = TodoItem(title: "", time: Date())
        todoItems.append(newItem)
    }
    
    func todoItems(for date: Date) -> [TodoItem] {
        let calendar = Calendar.current
        return todoItems.filter {
            calendar.isDate($0.time, inSameDayAs: date)
        }
    }
}
