//
//  RoutineGridView.swift
//  SoodoList
//
//  Created by 홍지수 on 6/25/24.
//

import SwiftUI

struct RoutineGridView: View {
    @Binding var routines: [Routine]
    @State private var isEditing = [UUID: Bool]()
    @State private var editedTitle = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(routines.indices, id: \.self) { index in
                let routine = routines[index]
                
                VStack {
                    HStack {
                        NavigationLink(destination: RoutineView(viewModel2: RoutineViewModel(routine: routine))) {
                            if isEditing[routine.id] == true {
                                TextField("Edit title", text: $editedTitle, onCommit: {
                                    routines[index].title = editedTitle
                                    isEditing[routine.id] = false
                                })
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            } else {
                                Text(routine.title)
                                    .lineLimit(1) // 한 줄로 제한
                                    .truncationMode(.tail) // 잘릴 경우 말줄임표
                                    //.minimumScaleFactor(0.5) // 폰트 최소 크기 설정
                                    .padding()
                                    .font(.system(size: 14))
                                    .foregroundColor(.purple)
                                    .fontWeight(.semibold)
                            }
                        }.navigationTitle(routine.title).foregroundColor(.purple)
                        
                        Spacer()
                        
                        Button(action: {
                            if isEditing[routine.id] == true {
                                routines[index].title = editedTitle
                            } else {
                                editedTitle = routine.title
                            }
                            isEditing[routine.id]?.toggle()
                        }) {
                            Text(isEditing[routine.id] == true ? "Save" : "Edit").font(.system(size: 13)).foregroundColor(.gray) // 폰트 최소 크기 설정
                        }
                        .padding(.trailing, 8)
                    }
                    .background(Color.purple.opacity(0.2))
                    .cornerRadius(8)
                }
                //.padding(.vertical)
            }
        }
        .padding()
        .onAppear {
            for routine in routines {
                isEditing[routine.id] = false
            }
        }
    }
}
