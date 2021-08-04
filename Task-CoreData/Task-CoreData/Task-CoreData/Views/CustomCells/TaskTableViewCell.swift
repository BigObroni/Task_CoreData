//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Nevan Bingham on 7/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func completionButtonTapped(for cell: TaskTableViewCell)
}
class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    weak var delegate: TaskCompletionDelegate?
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        delegate?.completionButtonTapped(for: self)
    }
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
        if task.isComplete {
            completionButton.setBackgroundImage(UIImage(named: "complete"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
            
        }
    }
}
