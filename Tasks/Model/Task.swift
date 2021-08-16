//
//  Task.swift
//  Task
//
//  Created by Владимир on 16.08.2021.
//

import Foundation

struct Task: Identifiable {
  var id = UUID().uuidString
  var title: String
  var completed = false
}

#if DEBUG
let testDataTasks = [
  Task(title: "Implement the UI", completed: true),
  Task(title: "Connect to Firebase"),
  Task(title: "????"),
  Task(title: "Profit!!!")
]
#endif
