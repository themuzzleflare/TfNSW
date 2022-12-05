import Foundation

public enum LocationType: String, Decodable {
  /// Point of Interest.
  case pointOfInterest = "poi"
  
  /// Singlehouse.
  case singlehouse
  
  /// Stop.
  case stop
  
  /// Platform.
  case platform
  
  /// Street.
  case street
  
  /// Locality.
  case locality
  
  /// Suburb.
  case suburb
  
  /// Unknown.
  case unknown
}

extension LocationType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .pointOfInterest:
      return "Point of Interest"
    case .singlehouse:
      return "Singlehouse"
    case .stop:
      return "Stop"
    case .platform:
      return "Platform"
    case .street:
      return "Street"
    case .locality:
      return "Locality"
    case .suburb:
      return "Suburb"
    case .unknown:
      return "Unknown"
    }
  }
}
