//
//  ContentView.swift
//  SoodoList
//
//  Created by 홍지수 on 6/25/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    //@ObservedObject var viewModel2: RoutineViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // 오늘의 날짜
                NavigationLink(destination: CalendarView(homeViewModel: viewModel)) {
                                    Text("오늘의 날짜: \(Date(), formatter: dateFormatter)")
                                        .padding()
                                        .foregroundColor(.purple)
                                }
                
                // Todo List와 + 버튼
                HStack {
                    Text("오늘의 할 일")
                        .font(.headline)
                        .padding()
                    Spacer()
                    Button(action: {
                        viewModel.addTodoItem()
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(.purple)
                    }
                }

                TodoListView(todoItems: $viewModel.todoItems)
                
                // Routine 블록
                VStack(alignment: .leading) {
                    Text("Routine")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        //.padding(.leading)
                    
                    RoutineGridView(routines: $viewModel.routines)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding()
                
            }
            .navigationTitle("Home")
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()
