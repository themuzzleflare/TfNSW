//
//  DurationUnitsFormatStyle+Extension.swift
//  
//
//  Created by Paul Tavitian on 4/2/2023.
//

import Foundation

internal extension Duration.UnitsFormatStyle {
  static let legDuration: Duration.UnitsFormatStyle = .units(allowed: [.hours, .minutes])
  
  static let relativeWaitTime: Duration.UnitsFormatStyle = .units(allowed: [.hours, .minutes],
                                                                  maximumUnitCount: 1)
}
