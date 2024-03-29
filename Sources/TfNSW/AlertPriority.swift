import Foundation

public enum AlertPriority: String, Decodable {
  /// Very low
  case veryLow
  
  /// Low
  case low
  
  /// Normal
  case normal
  
  /// High
  case high
  
  /// Very high
  case veryHigh
}

extension AlertPriority: CustomStringConvertible {
  public var description: String {
    switch self {
    case .veryLow:
      return "Very low"
    case .low:
      return "Low"
    case .normal:
      return "Normal"
    case .high:
      return "High"
    case .veryHigh:
      return "Very high"
    }
  }
}

public extension AlertPriority {
  var intValue: Int {
    switch self {
    case .veryLow:
      return 5
    case .low:
      return 4
    case .normal:
      return 3
    case .high:
      return 2
    case .veryHigh:
      return 1
    }
  }
}
