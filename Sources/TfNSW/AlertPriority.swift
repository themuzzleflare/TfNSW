import Foundation

public enum AlertPriority: String, Decodable {
  case veryLow
  case low
  case normal
  case high
  case veryHigh
}

extension AlertPriority {
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
