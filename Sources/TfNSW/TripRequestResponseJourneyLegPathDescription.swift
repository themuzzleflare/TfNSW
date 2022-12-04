import Foundation
import CoreLocation

public struct TripRequestResponseJourneyLegPathDescription: Decodable {
  /// Indicates the way you need to turn to execute this step of the path description.
  public var turnDirection: LegPathTurnDirection?
  
  /// Indicates what you have to do (in addition the turn `turnDirection`) to execute this step of the path description.
  public var manoeuvre: LegPathManoeuvre?
  
  /// This is a specific description of what to do. In some cases, this information is required in addition to the other properties provided in this step.
  public var name: String?
  
  /// Contains exactly two values: the first value is the latitude, the second value is the longitude. This is the location where the instruction occurs.
  public var coord: [CLLocationDegrees]?
  
  /// The direction in degrees (0-359) of the skyDirection
  public var skyDirection: Int?
  
  /// This is the duration of this step in seconds.
  public var duration: Int?
  
  /// This is the cumulative duration in seconds at the point of this step.
  public var cumDuration: Int?
  
  /// This is the distance travelled in this step in metres.
  public var distance: Int?
  
  /// This is the distance travelled upward in this step in metres
  public var distanceUp: Int?
  
  /// This is the distance travelled downward in this step in metres
  public var distanceDown: Int?
  
  /// This is the cumulative distance travelled in metres at the point of this step.
  public var cumDistance: Int?
  
  /// This field enables you to retrieve multiple coordinates from the `coords` property, starting from this index.
  public var fromCoordsIndex: Int?
  
  /// This field enables you to retrieve multiple coordinates from the `coords` property, ending at this index.
  public var toCoordsIndex: Int?
  
  public var properties: TripRequestResponseJourneyLegPathDescriptionProperties?
}
