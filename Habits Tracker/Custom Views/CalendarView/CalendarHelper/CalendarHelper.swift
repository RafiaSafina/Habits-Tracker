//
//  CalendarHelper.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 02.03.2023.
//

import Foundation

final class CalendarHelper {
    let calendar = Calendar.current
    var selectedDate = Date()
    
    func showNextMonth(date: Date) -> Date {
        calendar.date(byAdding: .month, value: 1, to: date) ?? Date()
    }
    
    func showPreviousMonth(date: Date) -> Date {
        calendar.date(byAdding: .month, value: -1, to: date) ?? Date()
    }
    
    func stringDate(date: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    
    //    текущий день
    func currentDayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day ?? 0
    }
    
//generate 1st day, days in month and 1st weekday
    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
        guard let numberOfDaysInMonth = calendar.range(of: .day, in: .month, for: baseDate)?.count,
              let firstDayOfMonth = calendar.date(
                from: calendar.dateComponents([.year, .month], from: baseDate))
        else {
            throw CalendarDataError.metadataGeneration
        }
        let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth) - 1
        
        return MonthMetadata(
            numberOfDays: numberOfDaysInMonth,
            firstDay: firstDayOfMonth,
            firstDayWeekday: firstDayWeekday)
    }
    
    func generateDaysInMonth(baseDate: Date) -> [Day] {
        guard let metadata = try? monthMetadata(for: baseDate) else {
            preconditionFailure("error")
        }
        let numberOfDays = metadata.numberOfDays
        let firstDayOfMonth = metadata.firstDay
        let offsetInInitialRow = metadata.firstDayWeekday
        
        var days: [Day] = (1..<(numberOfDays + offsetInInitialRow)).map { day in
                let isWithinDisplayedMonth = day >= offsetInInitialRow
              
                let dayOffset =
                isWithinDisplayedMonth ?
                day - offsetInInitialRow :
                -(offsetInInitialRow - day)
                
                return generateDay(
                    offsetBy: dayOffset,
                    for: firstDayOfMonth,
                    isWithinDisplayedMonth: isWithinDisplayedMonth)
            }
        days += generateStartOfNextMonth(using: firstDayOfMonth)

        return days
    }
    
    func generateDay(offsetBy dayOffset: Int, for baseDate: Date, isWithinDisplayedMonth: Bool) -> Day {
        let date = calendar.date(
            byAdding: .day,
            value: dayOffset,
            to: baseDate) ?? baseDate
        
        return Day(
            date: date,
            number: stringDate(date: date, dateFormat: "d"),
            isSelected: calendar.isDate(date, inSameDayAs: selectedDate),
            isWithinDisplayedMonth: isWithinDisplayedMonth
        )
    }
    
    func generateStartOfNextMonth(using firstDayOfDisplayedMonth: Date) -> [Day] {
        guard let lastDayInMonth = calendar.date(
                byAdding: DateComponents(month: 1, day: -1),
                to: firstDayOfDisplayedMonth)
        else { return [] }
        
        let additionalDays = 8 - calendar.component(.weekday, from: lastDayInMonth)
        guard additionalDays > 0 else {
            return []
        }
        
        let days: [Day] = (1...additionalDays).map { generateDay(
            offsetBy: $0,
            for: lastDayInMonth,
            isWithinDisplayedMonth: false)
        }
        return days
    }
    
}
