//
//  DateComponentsFormatter+Extension.swift
//  
//
//  Created by Paul Tavitian on 29/1/2023.
//

import Foundation

internal extension DateComponentsFormatter {
  static let shared: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .brief
    formatter.allowedUnits = [.hour, .minute]
    return formatter
  }()
}
