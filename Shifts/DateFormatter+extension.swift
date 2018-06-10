//
//  DateFormatter+extension.swift
//  Shifts
//
//  Created by Donna McCulloch on 8/6/18.
//  Copyright © 2018 Donna McCulloch. All rights reserved.
//

import Foundation

extension DateFormatter {
  // Example: "2018-04-20 9:00:00 -08:00"
  static let shiftDateInFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")

    return formatter
  }()

  static let shiftDateOutFormatter: DateFormatter = {
    let formatter = DateFormatter()
    let template = "EMMMMdd"

    formatter.setLocalizedDateFormatFromTemplate(template)

    return formatter
  }()

  static let shiftBeginTimeRangeFormatter: DateFormatter = {
    let formatter = DateFormatter()

    formatter.dateFormat = "h'-'"

    return formatter
  }()

  static let shiftEndTimeRangeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    let template = "ha"

    formatter.setLocalizedDateFormatFromTemplate(template)

    return formatter
  }()

  
}
