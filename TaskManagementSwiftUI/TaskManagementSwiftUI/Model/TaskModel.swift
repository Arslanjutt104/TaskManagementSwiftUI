//
//  TaskModel.swift
//  TaskManagementSwiftUI
//
//  Created by Mac on 21/09/2023.
//

import Foundation
import SwiftUI

struct TaskModel:Identifiable{
    var id = UUID().uuidString
    var taskTitle : String
    var taskDescripton:String
    var taskDate:Date
}
