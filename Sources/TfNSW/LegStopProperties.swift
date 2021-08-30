import Foundation

public struct LegStopProperties: Decodable {
  public var downloads: [TripRequestResponseJourneyLegStopDownload]? // Describes a list of downloadable files relevant to this location.
  public var WheelchairAccess: BooleanEnum? // Indicates if there is wheelchair access available at this stop. = ['true', 'false'].
  public var AREA_NIVEAU_DIVA: String?
  public var area: String?
  public var platform: String?
}
