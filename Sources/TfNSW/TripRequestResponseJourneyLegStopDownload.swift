import Foundation

public struct TripRequestResponseJourneyLegStopDownload: Decodable {
  /// This indicates what type of download this is. For example, `RM` refers to Route Map.
  public var type: String?

  /// This is the URL for the download.
  public var url: String?
}
