//
//  TaskCardView.swift
//  TaskManagementSwiftUI
//
//  Created by Mac on 21/09/2023.
//

import SwiftUI

struct TaskCardView: View {
    
    @State var objtask:TaskModel?
    
    var body: some View {
        HStack(alignment:.top, spacing: 30){
            VStack(spacing: 10){
                
                Circle().fill(Color.black).frame(width: 10,height: 10).background(Circle().stroke(lineWidth: 1.0).padding(-2))
                
                Rectangle().fill(Color.black).frame(width: 2)
                
                
            }
            
            VStack(){
                HStack(alignment:.top, spacing: 10){
                    VStack(alignment:.leading,spacing: 12){
                        Text(objtask?.taskTitle ?? "Error")
                            .font(.title2.bold())
                        Text(objtask?.taskDescripton ?? "hi")
                            .font(.callout)
                        
                        Text((objtask?.taskDate.formatted(date: .abbreviated, time: .omitted))!)
                    }
                }
            } .padding().foregroundColor(Color.white)
            .hLeading()
                .background(
                    Color.black
                        .cornerRadius(25)
                )
              
        } //HSTACK
        .hLeading()
        .padding()
    }
}

struct TaskCardView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardView()
    }
}
