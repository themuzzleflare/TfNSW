import Foundation

public struct AdditionalInfoResponseTimestamps: Decodable {
  public var creation: String? // A timestamp in YYYY-MM-DDTHH:MM:SSZ format that indicates when the alert was created.
  public var lastModification: String? // A timestamp in YYYY-MM-DDTHH:MM:SSZ format that indicates when the alert was last modified.
}
