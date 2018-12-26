//
//  Calendar+Utility.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 26/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import Foundation

// MARK: - Calendar Extension Methods

extension Calendar {
  
    /// Returns Current UTC Calendar
    public static var currentUTCCalendar: Calendar {
        var calendar = Calendar.current
        if let timeZone = TimeZone(abbreviation: TimeZone.UTC) {
            calendar.timeZone = timeZone
        }
        return calendar
    }
}
