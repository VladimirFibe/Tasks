//
//  TaskCellViewModel.swift
//  TaskCellViewModel
//
//  Created by Владимир on 16.08.2021.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
  @Published var task: Task
  @Published var completionStateIconName = ""
  var id = ""
  private var cancellable = Set<AnyCancellable>()
  init(task: Task) {
    self.task = task
    
    $task
      .map { $0.completed ? "checkmark.circle.fill" : "circle"}
      .assign(to: \.completionStateIconName, on: self)
      .store(in: &cancellable)
    
    $task
      .map { $0.id }
      .assign(to: \.id, on: self)
      .store(in: &cancellable)
  }
  

}
