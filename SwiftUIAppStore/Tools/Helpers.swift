//
//  Helpers.swift
//  SwiftUIAppStore
//
//  Created by Marble Interactive SL on 9/2/23.
//

import Foundation

func getCurrentDate(with format: String = "EEEE, MMM d") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: Date())
}
