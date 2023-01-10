import Foundation

public struct LegStopProperties: Decodable {
  public let stopId: String?
  
  /// Describes a list of downloadable files relevant to this location.
  public let downloads: [TripRequestResponseJourneyLegStopDownload]?
  
  /// Indicates if there is wheelchair access available at this stop. = ['true', 'false'].
  public let WheelchairAccess: BooleanEnum?
  
  public let AREA_NIVEAU_DIVA: String?
  
  public let AREA_NIVEAU_GIS: String?
  
  public let pbyb: String?
  
  public let occupancy: String?
  
  public let realtimeStatus: [String]?
  
  public let NumberOfCars: String?
  
  public let TravelInCarsFrom: String?
  
  public let TravelInCarsTo: String?
  
  public let TravelInCarsMessage: String?
  
  public let areaGid: String?
  
  public let area: String?
  
  public let platform: String?
}
