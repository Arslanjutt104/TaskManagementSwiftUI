//
//  TaskViewModel.swift
//  TaskManagementSwiftUI
//
//  Created by Mac on 21/09/2023.
//

import SwiftUI
import Foundation

class TaskViewModel:ObservableObject{
    
    @Published var storeTask:[TaskModel] = [
        
        TaskModel(taskTitle: "Meeting", taskDescripton: "Discuse task ", taskDate: .init(timeIntervalSince1970: 1641645497)),
        TaskModel(taskTitle: "Icon Set", taskDescripton: "Edit Icon fot team ", taskDate: .init(timeIntervalSince1970: 1641649097)),
        TaskModel(taskTitle: "Porototype", taskDescripton: "Make and Send protoype", taskDate: .init(timeIntervalSince1970: 1641652697)),
        TaskModel(taskTitle: "Check Asset", taskDescripton: "check assest to mobile developer", taskDate: .init(timeIntervalSince1970: 1641656297)),
        TaskModel(taskTitle: "Client Meeting", taskDescripton: "Explan project to Client", taskDate: .init(timeIntervalSince1970: 1641641897)),
    ]
    
    
    //MARK: Current week days
    @Published var currentWeek:[Date] = []
    
    //MARK: Current Date
    @Published var currentDate:Date = Date()
    
    //MARK: Fitler select day task
    @Published var filterTask:[TaskModel]?
    
    init(){
        fetchCurrentWeek()
        filterAllTask()
    }
    
    func fetchCurrentWeek(){
        let today = Date()
        let calender = Calendar.current
        let week =  calender.dateInterval(of: .weekday, for: today)
        
        guard let firstWeekDay =  week?.start else{return}
        
        (1...7).forEach { day in
            if let weekDay =  calender.date(byAdding: .day,value: day, to: firstWeekDay){
                return currentWeek.append(weekDay)
            }
        }
        
    }
    
    
    //MARK: Filter Task today
    func filterAllTask(){
        
        let calender = Calendar.current
        let filtered = storeTask.filter {
            return calender.isDate($0.taskDate, inSameDayAs: self.currentDate)
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.filterTask =  self.storeTask//filtered
        }
    }
    
    //DATE FORMATER
    func changeDateFormate(date:Date , formate:String) -> String{
        let formater = DateFormatter()
        formater.dateFormat = formate
        return  formater.string(from: date)
    }
    
    func isToday(date:Date)->Bool{
        let calender = Calendar.current
        return calender.isDate(currentDate, inSameDayAs: date)
    }
}
