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

   init(title:String,subtitle:String,coordinate:CLLocationCoordinate2D,id:Int){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.id = id
        super.init()
    }
}
