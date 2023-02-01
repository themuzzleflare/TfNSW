//
//  RelativeDateTimeFormatter+Extension.swift
//  
//
//  Created by Paul Tavitian on 29/1/2023.
//

import Foundation

internal extension RelativeDateTimeFormatter {
  static let shared: RelativeDateTimeFormatter = {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .short
    return formatter
  }()
}
