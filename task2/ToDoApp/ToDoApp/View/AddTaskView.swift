import SwiftUI

struct AddTaskView: View {
    @ObservedObject var ToDoVM: ToDoViewModel
    @State private var isEmptyTitle = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("New Task")

            HStack{
                TextField("I need to-do...", text: $ToDoVM.newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 8)
                
                Button(action: {
                    if !ToDoVM.newTaskTitle.isEmpty {
                        isEmptyTitle = false
                        ToDoVM.addTask(title: ToDoVM.newTaskTitle)
                        ToDoVM.newTaskTitle = ""
                        dismiss()
                    } else {
                        isEmptyTitle = true
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .alert("Task is empty", isPresented: $isEmptyTitle) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    AddTaskView(ToDoVM: .init())
}
