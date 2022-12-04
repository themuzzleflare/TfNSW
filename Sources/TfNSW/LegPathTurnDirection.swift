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
