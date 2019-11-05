//
//  TaskCell.swift
//  todo_swift
//
//  Created by Erkan on 11/4/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import UIKit

protocol ChangedButton {
    func changeButton(checked: Bool, index: Int)
}

class TaskCell: UITableViewCell {

    @IBAction func checkBoxAction(_ sender: Any) {
        if tasks![indexP!].checked{
            delegate?.changeButton(checked: false, index: indexP!)
        }else{
            delegate?.changeButton(checked: true, index: indexP!)
        }
    }
    @IBOutlet weak var checkBoxOutlet: UIButton!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var delegate: ChangedButton?
    var indexP: Int?
    var tasks: [Task]?
}
