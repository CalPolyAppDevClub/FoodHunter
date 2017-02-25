//
//  Post.swift
//  FoodHunter
//
//  Created by Joe Durand on 11/12/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import Firebase

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
    var ref: FIRDatabaseReference?
    
    var completeDetail: String {
        var result = ""
        result += "Provider: " + provider + "\n"
        result += "Starts: " + convertDate(date: start) + "\n"
        result += "Ends: " + convertDate(date: end) + "\n"
        result += "Where: " + location.alias + "\n"
        result += "Details: " + detail + "\n"
        return result
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        detail = snapshotValue["detail"] as! String
        end = Date(dateString: snapshotValue["end"] as! String)
        food = snapshotValue["food"] as! String
        let locationValue = snapshot.childSnapshot(forPath: "location").value as! [String: AnyObject]
        location = Location(longitude: locationValue["longitude"]! as! Double, latitude: locationValue["latitude"] as! Double, alias: locationValue["alias"] as! String)
        provider = snapshotValue["provider"] as! String
        schema = snapshotValue["schema"] as! Int
        start = Date(dateString: snapshotValue["start"] as! String)
        ref = snapshot.ref
    }
    
    override init() {
    }
}


extension Date
{
    init(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        if let d = dateStringFormatter.date(from: dateString){
            self.init(timeInterval: 0, since:d)
        }
        else {
            self.init(timeInterval: 0, since: Date())
        }
    }
}
