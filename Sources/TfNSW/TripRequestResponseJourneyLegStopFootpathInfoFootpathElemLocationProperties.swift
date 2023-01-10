import Foundation

public struct TripRequestResponseJourneyLegStopFootpathInfoFootpathElemLocationProperties: Decodable {
  /// This is an internal value used to group stops together.
  public let area: Int?
  
  /// If available, this is a platform number that relates to this instruction. It defaults to `0` if there is no such information available.
  public let platform: Int?
  
  /// This is an identifier for this particular instruction / location, based on its location.
  public let georef: String?
}
