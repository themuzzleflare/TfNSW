import Foundation

public enum FootpathInfoPosition: String, Decodable {
  case before = "BEFORE"
  case after = "AFTER"
  case idest = "IDEST"
}

extension FootpathInfoPosition: CustomStringConvertible {
  public var description: String {
    switch self {
    case .before:
      return "Before"
    case .after:
      return "After"
    case .idest:
      return "In Destination"
    }
  }
}
