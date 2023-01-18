import Foundation

public enum LegStopOccupancy: String, Decodable {
  case manySeats = "MANY_SEATS"
  case fewSeats = "FEW_SEATS"
  case standingOnly = "STANDING_ONLY"
  case crushedStanding = "CRUSHED_STANDING"
  case full = "FULL"
}

extension LegStopOccupancy: CustomStringConvertible {
  public var description: String {
    switch self {
    case .manySeats:
      return "Many Seats Available"
    case .fewSeats:
      return "Few Seats Available"
    case .standingOnly:
      return "Standing Room Only"
    case .crushedStanding:
      return "Crushed Standing Room Only"
    case .full:
      return "Full"
    }
  }
}
