//
//  ToDo.swift
//  TodoListProject
//
//  Created by khuloud alshammari on 17/01/1445 AH.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String?
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var decreption = ""
    var isCompleted = false
    var backlog = false
    var todo = false
    var inProgress = false
    var low = false
    var medium = false
    var high = false
     var like = false
}
