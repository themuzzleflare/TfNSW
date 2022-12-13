import Foundation
import SwiftDate

public struct AdditionalInfoResponseTimestamps: Decodable {
  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates when the alert was created.
  public var creation: String?
  
  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates when the alert was last modified.
  public var lastModification: String?
}

extension AdditionalInfoResponseTimestamps {
  /// The `Date` value of `creation`.
  public var creationDate: DateInRegion? {
    return creation?.toDate(region: .current)
  }
  
  /// The `Date` value of `lastModification`.
  public var lastModificationDate: DateInRegion? {
    return lastModification?.toDate(region: .current)
  }
}
