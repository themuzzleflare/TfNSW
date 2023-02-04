//
//  FormatStyle+Extension.swift
//  
//
//  Created by Paul Tavitian on 3/2/2023.
//

import Foundation

internal extension FormatStyle where Self == Date.FormatStyle {
  static var shortenedTime: Self {
    return .shortenedTime
  }
}

internal extension FormatStyle where Self == Date.RelativeFormatStyle {
  static var relativeLabel: Self {
    return .relativeLabel
  }
}

internal extension FormatStyle where Self == Duration.UnitsFormatStyle {
  static var legDuration: Self {
    return .legDuration
  }
  
  static var relativeWaitTime: Self {
    return .relativeWaitTime
  }
}
