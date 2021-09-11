import Foundation

public enum BooleanEnum: String, Decodable {
  /// A value of "true".
  case trueValue = "true"

  /// A value of "false".
  case falseValue = "false"

  /// A value of "1".
  case oneValue = "1"

  /// A value of "0".
  case zeroValue = "0"
}

extension BooleanEnum {
  /// The  `Bool` value of  `BooleanEnum`.
  public var boolValue: Bool {
    switch self {
    case .trueValue, .oneValue:
      return true
    case .falseValue, .zeroValue:
      return false
    }
  }
}

#if os(macOS)

import Vapor

extension BooleanEnum: Content {}

#endif
