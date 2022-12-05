import Foundation

public enum FootpathElemLevelType: String, Decodable {
  case down = "DOWN"
  case level = "LEVEL"
  case up = "UP"
}

extension FootpathElemLevelType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .down:
      return "Down"
    case .level:
      return "Level"
    case .up:
      return "Up"
    }
  }
}
