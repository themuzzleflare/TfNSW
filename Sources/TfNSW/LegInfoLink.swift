import Foundation

public typealias LegInfoLink = TripJourney.Leg.Info.InfoLink

public extension TripJourney.Leg.Info {
  struct InfoLink: Decodable, Equatable {
    /// This field contains a title that can be used when displaying the `url` URL. This value is equivalent to the `infoLinkText` value in `add_info`.
    public let urlText: String?
    
    /// This field contains a URL that contains additional information about the alert. This value is equivalent to the `infoLinkURL` value in `add_info`.
    public let url: String?
    
    /// This is the descriptive alert content. It may contain HTML tags and/or HTML entities.
    public let content: String?
    
    /// This is short summary that can be used as a heading for the alert content. It may contain HTML tags and/or HTML entities.
    public let subtitle: String?
    
    /// This is a plaintext summary of the alert content, although note that it may contain HTML entities such as `&nbsp;`.
    public let smsText: String?
    
    public let speechText: String?
  }
}
