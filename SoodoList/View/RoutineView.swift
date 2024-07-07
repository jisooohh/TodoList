import SwiftUI

struct RoutineView: View {
    //@Binding var viewModel: RoutineViewModel
    @ObservedObject var viewModel2: RoutineViewModel
    //@Binding var routine: Routine
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel2.addTodoItem()
            }) {
                Image(systemName: "plus")
                    .padding()
                    .foregroundColor(.purple)
            }

            RoutineDetailView(detailItems: $viewModel2.RoutineItems)
        }
    }
    
   
    /*
    func addItem() {
        viewModel.RoutineItems.append(TodoItem(title: "New Item", time: Date()))
    }
     */
}


/*
struct RoutineDetailView: View {
    @StateObject var viewModel: RoutineViewModel
    @State private var isEditMode = false
    @State private var newItemTitle = ""
    @State private var editedItemTitle = ""
    @State private var selectedItem: TodoItem?

    init(viewModel: RoutineViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.routine.items) { item in
                    if item.id == selectedItem?.id && isEditMode {
                        HStack {
                            TextField("Edit item", text: $editedItemTitle, onCommit: {
                                if let editedItemIndex = viewModel.routine.items.firstIndex(where: { $0.id == item.id }) {
                                    viewModel.routine.items[editedItemIndex].title = editedItemTitle
                                    endEditing()
                                }
                            })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, 8)

                            Button(action: {
                                endEditing()
                            }) {
                                Text("Done")
                            }
                        }
                    } else {
                        HStack {
                            Text(item.title).foregroundColor(.purple)
                            Spacer()
                            if item.isCompleted {
                                Image(systemName: "checkmark")
                            }
                            Button(action: {
                                beginEditing(item)
                            }) {
                                Image(systemName: "pencil.circle")
                                    .foregroundColor(.blue)
                            }
                            .padding(.trailing, 8)
                            Button(action: {
                                deleteItem(item)
                            }) {
                                Image(systemName: "trash.circle")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle(viewModel.routine.title)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        addItem()
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
        }
        .padding()
    }

    private func deleteItems(at offsets: IndexSet) {
        viewModel.routine.items.remove(atOffsets: offsets)
    }

    private func addItem() {
        viewModel.routine.items.append(TodoItem(title: "New Item",time: Date(), isCompleted: false))
    }

    private func beginEditing(_ item: TodoItem) {
        isEditMode = true
        selectedItem = item
        editedItemTitle = item.title
    }

    private func endEditing() {
        isEditMode = false
        selectedItem = nil
        editedItemTitle = ""
    }

    private func deleteItem(_ item: TodoItem) {
        if let index = viewModel.routine.items.firstIndex(where: { $0.id == item.id }) {
            viewModel.routine.items.remove(at: index)
        }
    }
}

*/
