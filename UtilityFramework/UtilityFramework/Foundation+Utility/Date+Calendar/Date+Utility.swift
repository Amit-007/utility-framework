//
//  Date+Utility.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 26/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import Foundation

// MARK: - Date Extension Methods

extension Date {
    
    /// Returns Current Date
    public static var current: Date {
        return Date().startOfDay
    }
    
    /// Returns the start date time of any particular date
    public var startOfDay: Date {
        return Calendar.currentUTCCalendar.startOfDay(for: self)
    }
    
    /// Returns the end date time of any particular date
    public var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.currentUTCCalendar.date(byAdding: components, to: self) ?? Date.current.endOfDay
    }
    
    public var startOfWeek: Date {
        guard let date = Calendar.currentUTCCalendar.date(from: Calendar.currentUTCCalendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else {
            return Date.current
        }
        let daylightSavingTimeOffset = TimeZone.current.daylightSavingTimeOffset(for: date)
        let startDateOfWeek = date.addingTimeInterval(daylightSavingTimeOffset)
        return startDateOfWeek
    }
    
    public var endOfWeek: Date {
        guard let endOfWeek = Calendar.currentUTCCalendar.date(byAdding: .day,
                                                               value: 6,
                                                               to: self.startOfWeek) else {
            return Date.current
        }
        return endOfWeek
    }
    
    public var isWeekend: Bool {
        return Calendar(identifier: .gregorian).isDateInWeekend(self)
    }
    
    /// Returns the hour representation of a date
    public var hour: Int {
        return Calendar.currentUTCCalendar.component(.hour, from: self)
    }
    
    /// Returns the minute representation of a date
    public var minute: Int {
        return Calendar.currentUTCCalendar.component(.minute, from: self)
    }
    
    /// Returns the second representation of a date
    public var second: Int {
        return Calendar.currentUTCCalendar.component(.second, from: self)
    }
    
    /// Returns the day representation of a date
    public var day: Int {
        return Calendar.currentUTCCalendar.component(.day, from: self)
    }
    
    /// Returns the month representation of a date
    public var month: Int {
        return Calendar.currentUTCCalendar.component(.month, from: self)
    }
    
    /// Returns the month symbols of a date
    public var monthSymbol: String {
        return Calendar.currentUTCCalendar.monthSymbols[self.month - 1]
    }
    
    /// Returns the short month symbols of a date
    public var shortMonthSymbol: String {
        return Calendar.currentUTCCalendar.shortMonthSymbols[self.month - 1]
    }
    
    /// Returns the very short month symbols of a date
    public var veryShortMonthSymbol: String {
        return Calendar.currentUTCCalendar.veryShortMonthSymbols[self.month - 1]
    }
    
    /// Returns the year representation of a date
    public var year: Int {
        return Calendar.currentUTCCalendar.component(.year, from: self)
    }
    
    /// Returns the era representation of a date
    public var era: Int {
        return Calendar.currentUTCCalendar.component(.era, from: self)
    }
    
    /// Returns the weekday representation of a date
    public var weekday: Int {
        return Calendar.currentUTCCalendar.component(.weekday, from: self)
    }
    
    /// Returns the long weekday representation of a date
    public var weekdaySymbol: String {
        return Calendar.currentUTCCalendar.weekdaySymbols[self.weekday - 1]
    }
    
    /// Returns the short weekday representation of a date
    public var shortWeekdaySymbol: String {
        return Calendar.currentUTCCalendar.shortWeekdaySymbols[self.weekday - 1]
    }
    
    /// Returns the very short weekday representation of a date
    public var veryShortWeekdaySymbol: String {
        return Calendar.currentUTCCalendar.veryShortWeekdaySymbols[self.weekday - 1]
    }
    
    /// Returns the standalone weekday representation of a date
    public var standaloneWeekdaySymbol: String {
        return Calendar.currentUTCCalendar.standaloneWeekdaySymbols[self.weekday - 1]
    }
    
    /// Returns the weekday Ordinal representation of a date
    public var weekdayOrdinal: Int {
        return Calendar.currentUTCCalendar.component(.weekdayOrdinal, from: self)
    }
    
    /// Returns the week Of Month representation of a date
    public var weekOfMonth: Int {
        return Calendar.currentUTCCalendar.component(.weekOfMonth, from: self)
    }
    
    /// Returns the week Of Year representation of a date
    public var weekOfYear: Int {
        return Calendar.currentUTCCalendar.component(.weekOfYear, from: self)
    }
    
    /// Returns the year for week of year representation of a date
    public var yearForWeekOfYear: Int {
        return Calendar.currentUTCCalendar.component(.yearForWeekOfYear, from: self)
    }
    
    /// Returns the quarter representation of a date
    public var quarter: Int {
        return Calendar.currentUTCCalendar.component(.quarter, from: self)
    }
    
    /// Returns the nanoseconds of a date
    public var nanosecond: Int {
        return Calendar.currentUTCCalendar.component(.nanosecond, from: self)
    }
    
    /// Returns the timeZone representation of a date
    public var timeZone: Int {
        return Calendar.currentUTCCalendar.component(.timeZone, from: self)
    }
}

extension Date {
    
    /// This method returns a custom date
    ///
    /// - Parameters:
    ///   - day: day component of the date
    ///   - month: month component of the date
    ///   - year: year component of the date
    /// - Returns: A custom date
    
    public static func getCustomDate(day: Int, month: Int, year: Int) -> Date {
        let dateComponents = DateComponents(calendar: Calendar.currentUTCCalendar,
                                            year: year,
                                            month: month,
                                            day: day)
        guard let date = Calendar.currentUTCCalendar.date(from: dateComponents) else {
            return Date.current
        }
        return date.startOfDay
    }
}
