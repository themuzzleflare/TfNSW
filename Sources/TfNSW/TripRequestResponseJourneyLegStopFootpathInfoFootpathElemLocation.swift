import Foundation
import CoreLocation

public struct TripRequestResponseJourneyLegStopFootpathInfoFootpathElemLocation: Decodable {
  /// This the unique ID for the stop in which this instruction occurs.
  public var id: String
  
  public var isGlobalId: Bool?
  
  /// This is the type of location in which this instruction occurs.
  public var type: LocationType?
  
  /// Contains exactly two values: the first value is the latitude, the second value is the longitude. Although multiple instructions may reference the same location, this coordinate is specific to this particular instruction.
  public var coord: [CLLocationDegrees]?
  
  public var properties: TripRequestResponseJourneyLegStopFootpathInfoFootpathElemLocationProperties?
}
