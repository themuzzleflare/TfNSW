import Foundation

public enum AlertPriority: String, Decodable {
  /// Very low.
  case veryLow
  
  /// Low.
  case low
  
  /// Normal.
  case normal
  
  /// High.
  case high
  
  /// Very high.
  case veryHigh
}

extension AlertPriority: CustomStringConvertible {
  /// The description of the alert priority.
  public var description: String {
    switch self {
    case .veryLow:
      return "Very Low"
    case .low:
      return "Low"
    case .normal:
      return "Normal"
    case .high:
      return "High"
    case .veryHigh:
      return "Very High"
    }
  }
}
