import Foundation

public struct TripRequestResponseJourneyLegStopInfoLink: Decodable {
  /// This field contains a title that can be used when displaying the `url` URL. This value is equivalent to the `infoLinkText` value in `add_info`.
  public var urlText: String?
  
  /// This field contains a URL that contains additional information about the alert. This value is equivalent to the `infoLinkURL` value in `add_info`.
  public var url: String?
  
  /// This is the descriptive alert content. It may contain HTML tags and/or HTML entities.
  public var content: String?
  
  /// This is short summary that can be used as a heading for the alert content. It may contain HTML tags and/or HTML entities.
  public var subtitle: String?
  
  public var smsText: String?
  
  public var speechText: String?
}
