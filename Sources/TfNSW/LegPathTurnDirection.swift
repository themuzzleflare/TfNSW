import Foundation

public enum LegPathTurnDirection: String, Decodable {
  case unknown = "UNKNOWN"
  case straight = "STRAIGHT"
  case right = "RIGHT"
  case left = "LEFT"
  case slightRight = "SLIGHT_RIGHT"
  case slightLeft = "SLIGHT_LEFT"
  case sharpLeft = "SHARP_LEFT"
  case sharpRight = "SHARP_RIGHT"
}

extension LegPathTurnDirection: CustomStringConvertible {
  public var description: String {
    switch self {
    case .unknown:
      return "Unknown"
    case .straight:
      return "Straight"
    case .right:
      return "Right"
    case .left:
      return "Left"
    case .slightRight:
      return "Slight Right"
    case .slightLeft:
      return "Slight Left"
    case .sharpLeft:
      return "Sharp Left"
    case .sharpRight:
      return "Sharp Right"
    }
  }
}
