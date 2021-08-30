import Foundation

public struct TripRequestResponseJourneyLegStopDownload: Decodable {
  public var type: String? // This indicates what type of download this is. For example, RM refers to Route Map.
  public var url: String? // This is the URL for the download.
}
