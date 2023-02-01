import Foundation

public struct AdditionalInfoResponseTimestamps: Decodable, Equatable {
  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates when the alert was created.
  public let creation: String?
  
  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates when the alert was last modified.
  public let lastModification: String?
}

public extension AdditionalInfoResponseTimestamps {
  var creationDate: Date? {
    guard let creation else { return nil }
    return ISO8601DateFormatter.shared.date(from: creation)
  }
  
  var lastModificationDate: Date? {
    guard let lastModification else { return nil }
    return ISO8601DateFormatter.shared.date(from: lastModification)
  }
}
