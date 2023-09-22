//
//  HomeView.swift
//  TaskManagementSwiftUI
//
//  Created by Mac on 21/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: PROPERTIES
    @StateObject var taskModel:TaskViewModel = TaskViewModel()
    @Namespace var animation
    
    //MARK: BODY
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                
                Section {
                    
                    //MARK: Current Week View
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack(spacing: 10) {
                            HStack(spacing: 10) {
                                ForEach(taskModel.currentWeek,id: \.self){ day in
                                    
                                    VStack(spacing: 10) {
                                        Text(taskModel.changeDateFormate(date: day, formate: "dd"))
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                        
                                        Text(taskModel.changeDateFormate(date: day, formate: "EEE"))
                                            .font(.system(size: 14))
                                        
                                        Circle().fill(Color.white).frame(width: 8, height: 8)
                                            .opacity(taskModel.isToday(date: day) ? 1 : 0)
                                        
                                      
                                        
                                    }//VSTACK
                                    
                                    .foregroundStyle(taskModel.isToday(date: day) ? .primary : .tertiary)
                                    
                                    .foregroundColor(taskModel.isToday(date: day) ? Color.white : Color.black)
                                    
                                    .frame(width: 45, height: 90)
                                    .background(
                                        ZStack(){
                                            if  taskModel.isToday(date: day) {
                                                Capsule().fill(.black).matchedGeometryEffect(id: "CURRENTDATE", in: animation)
                                            }
                                        }).contentShape(Capsule()).onTapGesture {
                                            withAnimation {
                                                taskModel.currentDate = day
                                            }
                                        }
                                }//:FOREACH
                            
                            }//:HSTACK
                            .padding(.horizontal)
                            TaskView()
                        } //:VSTACK
                     
                    }.ignoresSafeArea(.container,edges: .top)
                    //:SCROLLVIEW
                    
                }header: {
                  HeaderView()
                }
                
            }//:LAZYVSTACK
            
        }//:SCROLLVIEW
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
