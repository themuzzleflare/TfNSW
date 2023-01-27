import Foundation

public typealias FootpathElemLevel = TripJourney.Leg.FootpathInfo.FootpathElem.Level

public extension TripJourney.Leg.FootpathInfo.FootpathElem {
  enum Level: String, Decodable {
    case down = "DOWN"
    case level = "LEVEL"
    case up = "UP"
  }
}

extension FootpathElemLevel: CustomStringConvertible {
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
