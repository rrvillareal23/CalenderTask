import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "Talk to Parents"),
        Task(title: "Make changes to app"),
        Task(title: "Workout"),
    ], taskDate: getSampleDate(offset: 1)),
    
    TaskMetaData(task: [
        Task(title: "Walk the dog")
    ], taskDate: getSampleDate(offset: -3)),
    
    TaskMetaData(task: [
        Task(title: "Make dinner")
    ], taskDate: getSampleDate(offset: -8)),
    
    TaskMetaData(task: [
        Task(title: "Call Jimmy")
    ], taskDate: getSampleDate(offset: 10)),
    
    TaskMetaData(task: [
        Task(title: "Work out")
    ], taskDate: getSampleDate(offset: -22)),
    
    TaskMetaData(task: [
        Task(title: "Start new Dev project")
    ], taskDate: getSampleDate(offset: 15)),
    
    TaskMetaData(task: [
        Task(title: "Dinner Plans")
    ], taskDate: getSampleDate(offset: -20)),
]
