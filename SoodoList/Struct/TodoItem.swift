//
//  Model.swift
//  SoodoList
//
//  Created by 홍지수 on 6/25/24.
//

import Foundation

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
    var time: Date
    var isCompleted: Bool = false
}

