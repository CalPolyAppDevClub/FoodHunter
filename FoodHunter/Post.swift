//
//  Post.swift
//  FoodHunter
//
//  Created by Joe Durand on 11/12/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation

struct Location {
    var longitude: Double
    var latitude: Double
    var alias: String
}


class Post: NSObject {
    var detail: String = "DETAIL"
    var end: Date = Date()
    var food: String = "FOOD"
    var location: Location = Location.init(longitude: 00.000, latitude: 000.000, alias: "Library")
    var provider: String = "PROVIDER"
    var schema: Int = 1
    var start: Date = Date()
}
