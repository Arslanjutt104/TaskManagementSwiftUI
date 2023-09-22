//
//  TaskView.swift
//  TaskManagementSwiftUI
//
//  Created by Mac on 21/09/2023.
//

import SwiftUI

struct TaskView: View {
    @State var taskModel:TaskViewModel = TaskViewModel()
    
    var body: some View {
        
        LazyVStack(spacing: 10) {
            if let tasks = taskModel.filterTask{
                if tasks.isEmpty{
                    Text("No Task")
                }else{
                    ForEach(tasks){ task in
                        TaskCardView(objtask: task)
                    }
                }
            }else{
                ProgressView().offset(y:200)
            }
        }
        .onChange(of: taskModel.currentDate) { newValue in
            taskModel.filterAllTask()
        }
    }
}


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
