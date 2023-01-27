import Foundation

public typealias LegInfoProperties = TripJourney.Leg.Info.Properties

public extension TripJourney.Leg.Info {
  struct Properties: Decodable, Equatable {
    public let publisher: String?
    
    public let infoType: `Type`?
    
    public let appliesTo: Application?
    
    public let stopIDglobalID: String?
    
    public enum Application: String, Decodable, CustomStringConvertible {
      case departingArriving
      
      public var description: String {
        switch self {
        case .departingArriving:
          return "Departing/Arriving"
        }
      }
    }
  }
}
