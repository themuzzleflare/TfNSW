import Foundation

public typealias TripJourneyLegInfo = TripJourney.Leg.Info

public extension TripJourney.Leg {
  struct Info: Decodable {
    /// This contains a number of timestamps that describe when the alert was created, and when the described alert actually takes place and/or is relevant.
    public let timestamps: AdditionalInfoResponseTimestamps?
    
    /// This value indicates how important the service alert is. A value of `high` or `veryHigh` likely indicates that the alert will correspond to an event that impacts the ability to travel for relevant users, while `low` or `veryLow` might be more of an informational message. = ['veryLow', 'low', 'normal', 'high', 'veryHigh'].
    public let priority: AlertPriority?
    
    /// This is a unique identifier for this particular service alert. Note that this same ID is used in `add_info` for the same alert.
    public let id: String?
    
    /// This number indicates the version of this alert. Initially when it is created it has version `1`, but if it is then updated it will have a new `lastModification` value and the version will now be `2`.
    public let version: Int?
    
    public let type: `Type`?
    
    public let infoLinks: [InfoLink]?
    
    public let properties: Properties?
    
    public enum `Type`: String, Decodable, CustomStringConvertible {
      case routeInfo
      case stopInfo
      case stopBlocking
      case lineInfo
      case bannerInfo
      case tripMessage
      
      public var description: String {
        switch self {
        case .routeInfo:
          return "Route Info"
        case .stopInfo:
          return "Stop Info"
        case .stopBlocking:
          return "Stop Blocking"
        case .lineInfo:
          return "Line Info"
        case .bannerInfo:
          return "Banner Info"
        case .tripMessage:
          return "Trip Message"
        }
      }
    }
  }
}

extension TripJourneyLegInfo: Comparable {
  public static func < (lhs: TripJourneyLegInfo, rhs: TripJourneyLegInfo) -> Bool {
    return lhs.priority?.intValue ?? 6 < rhs.priority?.intValue ?? 6
  }
}
