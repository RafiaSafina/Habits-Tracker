//
//  HabitsListModel.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 16.02.2023.
//

import Foundation

struct HabitList {
    var name = ""
    var date = Date()
    var habits: [Habit] = []
}

struct Habit {
    var name = ""
    var date = Date()
    var frequency = Date()
    var isReminded = false
}
