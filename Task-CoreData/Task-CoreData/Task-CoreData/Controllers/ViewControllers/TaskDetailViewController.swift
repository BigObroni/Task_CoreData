//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Nevan Bingham on 7/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskNotesTextView: UITextView!
    
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    var task: Task?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty else { return }
        // let notes = taskNotesTextView.text, !notes.isEmpty else { return }
        if let task = task {
            //task.name = name
            //task.notes = notes
            //task.dueDate = date
            TaskController.shared.update(task: task, name: name, notes: taskNotesTextView.text, dueDate: taskDueDatePicker.date)
        } else { TaskController.shared.createTaskWith(name: name, notes: taskNotesTextView.text, dueDate: taskDueDatePicker.date)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        self.date = taskDueDatePicker.date
    }
    
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
    
}
