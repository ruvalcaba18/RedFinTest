//
//  CustomMKAnnotation.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation
import MapKit
import UIKit

class CustomMKAnnotation: NSObject,MKAnnotation{
    var title:String?
    var subtitle:String?
    var coordinate: CLLocationCoordinate2D
    var id:Int
    var foodTruckDescription:String?
    var dayOpen:String?
    var starHour:String?
    var endHour:String?

    init(title:String,subtitle:String,coordinate:CLLocationCoordinate2D,id:Int , startHour:String, endHour:String, foodTruckDescription:String, dayOpen:String){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.dayOpen = dayOpen
        self.starHour = startHour
        self.endHour = endHour
        self.foodTruckDescription = foodTruckDescription
        self.id = id
        super.init()
    }
}
