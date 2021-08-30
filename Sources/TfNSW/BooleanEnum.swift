import Foundation

public enum BooleanEnum: String, Decodable {
  case trueValue = "true"
  case falseValue = "false"
  case oneValue = "1"
  case zeroValue = "0"
}

extension BooleanEnum {
  /// The  `Bool` value of the `BooleanEnum`.
  public var boolValue: Bool {
    switch self {
    case .trueValue, .oneValue:
      return true
    case .falseValue, .zeroValue:
      return false
    }
  }
}
