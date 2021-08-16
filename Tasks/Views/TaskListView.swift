//
//  TaskListView.swift
//  Tasks
//
//  Created by Владимир on 16.08.2021.
//

import SwiftUI

struct TaskListView: View {
  @ObservedObject var taskListVM = TaskListViewModel()
  @State var presentAddNewItem = false
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        List {
          ForEach(taskListVM.taskCellViewModels) { taskCellVM in
            TaskCell(taskCellVM: taskCellVM)
          }
          if presentAddNewItem {
            TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: ""))) { task in
              taskListVM.addTask(task)
              presentAddNewItem.toggle()
            }
          }
        }
        .listStyle(.plain)
        addNewTaskButton
          .padding()
      }
      .navigationTitle("Tasks")
    }
  }
  var addNewTaskButton: some View {
    Button(action: {
      presentAddNewItem.toggle()
    }) {
      Label("Add New Task", systemImage: "plus.circle.fill")
    }
  }
}


struct TaskListView_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView()
  }
}

struct TaskCell: View {
  @ObservedObject var taskCellVM: TaskCellViewModel
  var onCommit: (Task) -> (Void) = { _ in }
  var body: some View {
    HStack {
      Image(systemName: taskCellVM.completionStateIconName)
        .resizable()
        .frame(width: 20, height: 20)
        .onTapGesture {
          taskCellVM.task.completed.toggle()
        }
      TextField("Enter th task title", text: $taskCellVM.task.title) { _ in
      } onCommit: {
        onCommit(taskCellVM.task)
      }

    }
  }
}
