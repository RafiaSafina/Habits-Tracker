//
//  MonthMetadataModel.swift
//  Habits Tracker
//
//  Created by Рафия Сафина on 22.02.2023.
//

import Foundation

struct MonthMetadata {
    let numberOfDays: Int
    let firstDay: Date
    let firstDayWeekday: Int
    
//    let selectedDate: Date
//
//    var baseDate: Date {
//      didSet {
//        days = generateDaysInMonth(for: baseDate)
////        collectionView.reloadData()
////        headerView.baseDate = baseDate
//      }
//    }
//
//    lazy var days = generateDaysInMonth(for: baseDate)
//
//    var numberOfWeeksInBaseDate: Int {
//      calendar.range(of: .weekOfMonth, in: .month, for: baseDate)?.count ?? 0
//    }
//
//    let selectedDateChanged: ((Date) -> Void)
//    let calendar = Calendar(identifier: .gregorian)
//
//    lazy var dateFormatter: DateFormatter = {
//      let dateFormatter = DateFormatter()
//      dateFormatter.dateFormat = "d"
//      return dateFormatter
//    }()
//
//    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
//        guard
//            let numberOfDaysInMonth = calendar.range(
//                of: .day,
//                in: .month,
//                for: baseDate)?.count,
//            let firstDayOfMonth = calendar.date(
//                from: calendar.dateComponents([.year, .month], from: baseDate))
//        else {
//            throw CalendarDataError.metadataGeneration
//        }
//
//        let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth) - 1
//
//        return MonthMetadata(
//            numberOfDays: numberOfDaysInMonth,
//            firstDay: firstDayOfMonth,
//            firstDayWeekday: firstDayWeekday)
//    }
//
//    mutating func generateDaysInMonth(for baseDate: Date) -> [Day] {
//        guard let metadata = try? monthMetadata(for: baseDate) else {
//            preconditionFailure("An error occurred when generating the metadata for \(baseDate)")
//        }
//
//        let numberOfDaysInMonth = metadata.numberOfDays
//        let offsetInInitialRow = metadata.firstDayWeekday
//        let firstDayOfMonth = metadata.firstDay
//
//        var days: [Day] = (1..<(numberOfDaysInMonth + offsetInInitialRow))
//            .map { day in
//                let isWithinDisplayedMonth = day >= offsetInInitialRow
//
//                let dayOffset =
//                isWithinDisplayedMonth ?
//                day - offsetInInitialRow :
//                -(offsetInInitialRow - day)
//
//                return generateDay(
//                    offsetBy: dayOffset,
//                    for: firstDayOfMonth,
//                    isWithinDisplayedMonth: isWithinDisplayedMonth)
//            }
//
//        days += generateStartOfNextMonth(using: firstDayOfMonth)
//
//        return days
//    }
//
//    mutating func generateDay(offsetBy dayOffset: Int, for baseDate: Date, isWithinDisplayedMonth: Bool) -> Day {
//        let date = calendar.date(
//            byAdding: .day,
//            value: dayOffset,
//            to: baseDate) ?? baseDate
//
//        return Day(
//            date: date,
//            number: dateFormatter.string(from: date),
//            isSelected: calendar.isDate(date, inSameDayAs: selectedDate),
//            isWithinDisplayedMonth: isWithinDisplayedMonth
//        )
//    }
//
//    mutating func generateStartOfNextMonth(using firstDayOfDisplayedMonth: Date) -> [Day] {
//        guard let lastDayInMonth = calendar.date(
//                byAdding: DateComponents(month: 1, day: -1),
//                to: firstDayOfDisplayedMonth)
//        else { return [] }
//
//        let additionalDays = 8 - calendar.component(.weekday, from: lastDayInMonth)
//        guard additionalDays > 0 else {
//            return []
//        }
//
//        let days: [Day] = (1...additionalDays).map { generateDay(
//            offsetBy: $0,
//            for: lastDayInMonth,
//            isWithinDisplayedMonth: false)
//        }
//
//        return days
//    }
}


