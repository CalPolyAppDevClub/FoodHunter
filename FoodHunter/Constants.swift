//
//  Constants.swift
//  FoodHunter
//
//  Created by Joe Durand on 2/11/17.
//  Copyright © 2017 Cal Poly App Dev. All rights reserved.
//

import Foundation

func convertDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d @ h:mma"
    let prettyDate = formatter.string(from: date)
    return prettyDate
}

func toDate(string: String) -> Date{
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d @ h:mma"
    let date = formatter.date(from: string)
    return date ?? Date()
}

func dateString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
    let uglyDate = formatter.string(from: date)
    return uglyDate
}
