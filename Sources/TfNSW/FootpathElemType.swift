import Foundation

public typealias FootpathElemType = TripJourney.Leg.FootpathInfo.FootpathElem.`Type`

public extension TripJourney.Leg.FootpathInfo.FootpathElem {
  enum `Type`: String, Decodable {
    case escalator = "ESCALATOR"
    case elevator = "ELEVATOR"
    case stairs = "STAIRS"
    case level = "LEVEL"
    case ramp = "RAMP"
  }
}

extension FootpathElemType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .escalator:
      return "Escalator"
    case .elevator:
      return "Elevator"
    case .stairs:
      return "Stairs"
    case .level:
      return "Level"
    case .ramp:
      return "Ramp"
    }
  }
}
