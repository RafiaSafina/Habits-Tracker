//
//  TestingData.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 05.03.2023.
//

import Foundation

struct TestingData {
    let habits = [ Habit(name: "do drugs", date: Date(), frequency: 3, isReminded: false, isDone: false),
                   Habit(name: "be annoying", date: Date(), frequency: 3, isReminded: false, isDone: true),
                   Habit(name: "drink 2l water", date: Date(), frequency: 3, isReminded: false, isDone: false)
    ]
}
