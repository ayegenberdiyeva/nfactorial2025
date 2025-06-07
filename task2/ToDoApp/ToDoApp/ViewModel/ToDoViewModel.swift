import Foundation

class ToDoViewModel: ObservableObject {
    @Published var tasks: [UserModel.TaskModel] = []
    @Published var newTaskTitle: String = ""
    
    private let tasksKey = "tasks"
    
    init() {
        loadTasks()
    }
    
    func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: tasksKey) else {
            self.tasks = []
            return
        }
        
        do {
            let decoded = try JSONDecoder().decode([UserModel.TaskModel].self, from: data)
            self.tasks = decoded
        } catch {
            self.tasks = []
            return
        }
    }
    
    func saveTasks() {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: tasksKey)
        } catch {
            
        }
    }
    
    func addTask(title: String){
        if title.isEmpty { return }
        
        let newTask = UserModel.TaskModel(id: UUID(), title: title, isCompleted: false)
        tasks.append(newTask)
        saveTasks()
    }
    
    func toggleTask(id: UUID){
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    func deleteTask(task: UserModel.TaskModel){
        tasks.removeAll(where: { $0.id == task.id })
        saveTasks()
    }
    
    func sortTasks(){
        tasks.sort { $0.isCompleted == $1.isCompleted ? $0.title < $1.title : $0.isCompleted }
        saveTasks()
    }
}
