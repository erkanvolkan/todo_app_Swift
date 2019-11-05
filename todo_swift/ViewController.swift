//
//  ViewController.swift
//  todo_swift
//
//  Created by Erkan on 11/4/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask,ChangedButton {
   
    
    func changeButton(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
    }
    
    
   
    
    
 
    @IBOutlet weak var tableView: UITableView!
    func addTask(name: String) {
        tasks.append(Task(name: name))
        tableView.reloadData()
    }
   
    

    var tasks: [Task] = []
    override func viewDidLoad() {
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete){
            tasks.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
   
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        cell.taskNameLabel.text = tasks[indexPath.row].name
        
        if tasks[indexPath.row].checked{
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "fillcheckbox"), for: UIControl.State.normal)
        }else{
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "progressbox"), for: UIControl.State.normal)
        }
        cell.delegate = self
         cell.indexP = indexPath.row
         cell.tasks = tasks
         
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
}



class Task {
    var name = ""
    var checked = false
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}
