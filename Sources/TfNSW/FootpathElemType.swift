import Foundation

public enum FootpathElemType: String, Decodable {
  case escalator = "ESCALATOR"
  case elevator = "ELEVATOR"
  case stairs = "STAIRS"
  case level = "LEVEL"
  case ramp = "RAMP"
}
