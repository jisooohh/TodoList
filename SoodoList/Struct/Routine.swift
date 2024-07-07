//
//  Routine.swift
//  SoodoList
//
//  Created by 홍지수 on 6/26/24.
//

import Foundation

struct Routine: Identifiable {
    var id = UUID()
    var title: String = ""
    var items: [TodoItem]

}
