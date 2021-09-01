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
