//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Nevan Bingham on 7/27/21.
//

import CoreData

class TaskController {
    
    static let shared = TaskController()
    
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    //MARK: - CRUD Methods
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(name: name, notes: notes ?? "-", dueDate: dueDate ?? Date())
        tasks.append(task)
        
        CoreDataStack.saveContext()
    }
    
    func fetchTasks() {
        let tasks = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        print(tasks.count)
        self.tasks = tasks
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        
        CoreDataStack.saveContext()
    }
    
    func deleteTask(_ task: Task) {
        guard let index = self.tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
}
