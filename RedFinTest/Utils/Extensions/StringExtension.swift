//
//  StringExtension.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation

extension String {
    func toHour() -> Int? {
        let components = self.components(separatedBy: ":")
        if components.count == 2,
           let hour = Int(components[0]) {
            return hour
        } else {
            return nil
        }
    }
}
