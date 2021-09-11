import Foundation

public struct TripRequestResponseJourneyLegStopInfo: Decodable {
  /// This contains a number of timestamps that describe when the alert was created, and when the described alert actually takes place and/or is relevant.
  public var timestamps: AdditionalInfoResponseTimestamps?

  /// This value indicates how important the service alert is. A value of `high` or `veryHigh` likely indicates that the alert will correspond to an event that impacts the ability to travel for relevant users, while `low` or `veryLow` might be more of an informational message. = ['veryLow', 'low', 'normal', 'high', 'veryHigh'].
  public var priority: AlertPriority?

  /// This is a unique identifier for this particular service alert. Note that this same ID is used in `add_info` for the same alert.
  public var id: String?

  /// This number indicates the version of this alert. Initially when it is created it has version `1`, but if it is then updated it will have a new `lastModification` value and the version will now be `2`.
  public var version: String?

  /// This field contains a title that can be used when displaying the `url` URL. This value is equivalent to the `infoLinkText` value in `add_info`.
  public var urlText: String?

  /// This field contains a URL that contains additional information about the alert. This value is equivalent to the `infoLinkURL` value in `add_info`.
  public var url: String?

  /// This is short summary that can be used as a heading for the alert content. It may contain HTML tags and/or HTML entities.
  public var subtitle: String?

  /// This is the descriptive alert content. It may contain HTML tags and/or HTML entities.
  public var content: String?

  public var properties: LegStopInfoProperties?
}

#if os(macOS)

import Vapor

extension TripRequestResponseJourneyLegStopInfo: Content {}

#endif
