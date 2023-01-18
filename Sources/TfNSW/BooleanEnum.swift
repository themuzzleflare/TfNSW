import Foundation

public enum BooleanEnum: String, Decodable {
  /// "true"
  case trueValue = "true"
  
  /// "false"
  case falseValue = "false"
  
  /// "1"
  case oneValue = "1"
  
  /// "0"
  case zeroValue = "0"
}

public extension BooleanEnum {
  var boolValue: Bool {
    switch self {
    case .trueValue, .oneValue:
      return true
    case .falseValue, .zeroValue:
      return false
    }
  }
}
