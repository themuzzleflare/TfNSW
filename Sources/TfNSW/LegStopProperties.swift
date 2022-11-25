import Foundation

public struct LegStopProperties: Decodable {
  /// Describes a list of downloadable files relevant to this location.
  public var downloads: [TripRequestResponseJourneyLegStopDownload]?
  
  /// Indicates if there is wheelchair access available at this stop. = ['true', 'false'].
  public var WheelchairAccess: BooleanEnum?
  
  public var AREA_NIVEAU_DIVA: String?
  
  public var realtimeStatus: [String]?
  
  public var NumberOfCars: String?
  
  public var TravelInCarsFrom: String?
  
  public var TravelInCarsTo: String?
  
  public var TravelInCarsMessage: String?
  
  public var area: String?
  
  public var platform: String?
}
