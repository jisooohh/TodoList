//
//  RoutineViewModel.swift
//  SoodoList
//
//  Created by 홍지수 on 6/26/24.
//

import Foundation
import Combine

class RoutineViewModel: ObservableObject {
    @Published var routine: Routine
    @Published var RoutineItems: [TodoItem] = []
    
    init(routine: Routine) {
        self.routine = routine
        RoutineItems = routine.items
    }
    
    func addTodoItem() {
        let newItem = TodoItem(title: "", time: Date())
        RoutineItems.append(newItem)
    }
}
