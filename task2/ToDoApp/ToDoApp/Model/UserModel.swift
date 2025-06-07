import Foundation

struct UserModel: Codable {
    var username: String
    var password: String
    var tasks: [TaskModel] = []
    
    var name: String?
    var email: String?
    var phone: String?
}

extension UserModel {
    struct TaskModel: Identifiable, Codable {
        let id: UUID
        var title: String
        var isCompleted: Bool
    }
}
