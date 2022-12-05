import Foundation

public enum LegPathManoeuvre: String, Decodable {
  case leave = "LEAVE"
  case keep = "KEEP"
  case turn = "TURN"
  case enter = "ENTER"
  case `continue` = "CONTINUE"
  case origin = "ORIGIN"
  case enterBuiltUpArea = "ENTER_BUILTUPAREA"
  case leaveBuiltUpArea = "LEAVE_BUILTUPAREA"
}

extension LegPathManoeuvre: CustomStringConvertible {
  public var description: String {
    switch self {
    case .leave:
      return "Leave"
    case .keep:
      return "Keep"
    case .turn:
      return "Turn"
    case .enter:
      return "Enter"
    case .continue:
      return "Continue"
    case .origin:
      return "Origin"
    case .enterBuiltUpArea:
      return "Enter Built Up Area"
    case .leaveBuiltUpArea:
      return "Leave Built Up Area"
    }
  }
}
