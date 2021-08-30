import Foundation

public struct TripRequestResponseJourneyLegInterchange: Decodable {
  /// This is a description of the interchange.
  public var desc: String?

  /// This indicates the mode of travel for the interchange. Both `99` and `100` indicate walking. = ['99', '100'].
  public var type: LocationType?

  /// This is a list of coordinates that makes up the path of the interchange.
  public var coords: [[Double]]?
}
