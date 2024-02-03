//
//  FoodTruckError.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation
public enum FoodTruckError: Error {
    case invalidURL
    case noData
    case decodingError(DecodingError)
    case other(Error)
}
