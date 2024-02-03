//
//  DateExtension.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation
extension Date {
    func isBetween(startDate: Date, endDate: Date) -> Bool {
        return (startDate...endDate).contains(self)
    }
    
    func isBetween(startTime: Date, endTime: Date) -> Bool {
        return (startTime...endTime).contains(self)
    }
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    static var currentHour: Int {
        return Calendar.current.component(.hour, from: Date())
    }
}
