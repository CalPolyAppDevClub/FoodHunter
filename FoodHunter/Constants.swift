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
