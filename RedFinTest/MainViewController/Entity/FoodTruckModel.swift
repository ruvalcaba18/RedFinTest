//
//  FoodTruckModel.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation

struct FoodTruckModel: Codable {
    let dayOrder: String?
    let dayOfWeekStr: String?
    let startTime: String?
    let endTime: String?
    let permit: String?
    let location: String?
    let locationdesc:String?
    let optionalText: String?
    let locationId: String?
    let start24: String?
    let end24: String?
    let cnn: String?
    let addrDateCreate: String?
    let addrDateModified: String?
    let block: String?
    let lot: String?
    let coldTruck: String?
    let applicant: String?
    let x: String?
    let y: String?
    let latitude: String?
    let longitude: String?
    let location2: Location2?
    let location2address:String?
    let location2state:String?
    let location2zip:String?
    let location2city:String?
    
    enum CodingKeys: String, CodingKey {
        case dayOrder = "dayorder"
        case dayOfWeekStr = "dayofweekstr"
        case startTime = "starttime"
        case endTime = "endtime"
        case permit
        case location
        case locationdesc
        case optionalText = "optionaltext"
        case locationId = "locationid"
        case start24
        case end24
        case cnn
        case addrDateCreate = "addr_date_create"
        case addrDateModified = "addr_date_modified"
        case block
        case lot
        case coldTruck = "coldtruck"
        case applicant
        case x
        case y
        case latitude
        case longitude
        case location2 = "location_2"
        case location2state = "location_2_state"
        case location2address = "location_2_address"
        case location2city = "location_2_city"
        case location2zip = "location_2_zip"
    }
    
    init(dayOrder: String? = nil,dayOfWeekStr: String? = nil,startTime: String? = nil,endTime: String? = nil,permit: String? = nil,location: String? = nil,locationdesc: String? = nil,
           optionalText: String? = nil,locationId: String? = nil,start24: String? = nil,end24: String? = nil,cnn: String? = nil,addrDateCreate: String? = nil,
           addrDateModified: String? = nil,block: String? = nil,lot: String? = nil,coldTruck: String? = nil,applicant: String? = nil,x: String? = nil,y: String? = nil,
           latitude: String? = nil,longitude: String? = nil,location2: Location2? = nil,location2address: String? = nil,location2state: String? = nil,location2zip: String? = nil,
           location2city: String? = nil
       ) {
           self.dayOrder = dayOrder
           self.dayOfWeekStr = dayOfWeekStr
           self.startTime = startTime
           self.endTime = endTime
           self.permit = permit
           self.location = location
           self.locationdesc = locationdesc
           self.optionalText = optionalText
           self.locationId = locationId
           self.start24 = start24
           self.end24 = end24
           self.cnn = cnn
           self.addrDateCreate = addrDateCreate
           self.addrDateModified = addrDateModified
           self.block = block
           self.lot = lot
           self.coldTruck = coldTruck
           self.applicant = applicant
           self.x = x
           self.y = y
           self.latitude = latitude
           self.longitude = longitude
           self.location2 = location2
           self.location2address = location2address
           self.location2state = location2state
           self.location2zip = location2zip
           self.location2city = location2city
       }
}

struct Location2: Codable {
    let type: String?
    let coordinates: [Double]?
}
