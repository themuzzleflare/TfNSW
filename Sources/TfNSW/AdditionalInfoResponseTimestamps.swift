import Foundation
import SwiftDate

public struct AdditionalInfoResponseTimestamps: Decodable, Equatable {
  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates when the alert was created.
  public let creation: String?
  
  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates when the alert was last modified.
  public let lastModification: String?
}

public extension AdditionalInfoResponseTimestamps {
  var creationDate: DateInRegion? {
    return creation?.toDate(region: .current)
  }
  
  var lastModificationDate: DateInRegion? {
    return lastModification?.toDate(region: .current)
  }
}
