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
