//
//  DateRelativeFormatStyle+Extension.swift
//  
//
//  Created by Paul Tavitian on 3/2/2023.
//

import Foundation

internal extension Date.RelativeFormatStyle {
  static let relativeLabel = Date.RelativeFormatStyle(presentation: .named,
                                                      unitsStyle: .abbreviated,
                                                      capitalizationContext: .listItem)
}
