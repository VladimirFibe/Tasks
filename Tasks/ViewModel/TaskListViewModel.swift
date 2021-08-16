//
//  TaskListViewModel.swift
//  TaskListViewModel
//
//  Created by Владимир on 16.08.2021.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
  @Published var taskCellViewModels = [TaskCellViewModel]()
  private var cancellable = Set<AnyCancellable>()
  
  init() {
    self.taskCellViewModels = testDataTasks.map { TaskCellViewModel(task: $0) }
  }
  
  func addTask(_ task: Task) {
    let taskVM = TaskCellViewModel(task: task)
    taskCellViewModels.append(taskVM)
  }
}
