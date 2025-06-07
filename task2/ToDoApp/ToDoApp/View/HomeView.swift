import SwiftUI

struct HomeView: View {
    @ObservedObject var ToDoVM: ToDoViewModel
    @State var showAddTaskView: Bool = false
    @State var isSorted: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Button (action: {
                        showAddTaskView = true
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.blue)
                    }
                    Spacer()
                    
                    if !isSorted {
                        Button(action: {
                            ToDoVM.sortTasks()
                            isSorted = true
                        }) {
                            Text("Sort")
                        }
                        
                    }
                }
                .padding()
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        if ToDoVM.tasks.isEmpty {
                            Text("No tasks yet!")
                        } else {
                            ForEach(ToDoVM.tasks) { task in
                                 HStack {
                                     Image(systemName: task.isCompleted ? "checkmark.circle.fill":"circle")
                                         .resizable()
                                         .frame(width: 24, height: 24)
                                         .onTapGesture {
                                             ToDoVM.toggleTask(id: task.id)
                                             isSorted = false
                                         }
                                         
                                     Text(task.title)
                                         .strikethrough(task.isCompleted)
                                     
                                     Spacer()
                                     
                                     Button (action: {
                                         ToDoVM.deleteTask(task: task)
                                     }) {
                                         Image(systemName: "trash.fill")
                                             .resizable()
                                             .frame(width: 24, height: 24)
                                     }
                                 }
                            }
                        }
                    }
                    .padding()
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(ToDoVM: ToDoVM)
            }
        }
    }
}

#Preview {
    HomeView(ToDoVM: ToDoViewModel())
}
