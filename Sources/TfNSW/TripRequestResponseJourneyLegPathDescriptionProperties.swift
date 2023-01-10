import Foundation

public struct TripRequestResponseJourneyLegPathDescriptionProperties: Decodable {
  public let floorLevelChangeDirection: String?
  
  public let floorLevelDifference: String?
  
  public let indoorType: String?
  
  public let outdoorType: [String]?
  
  public let trackIlluminated: String?
  
  enum CodingKeys: String, CodingKey {
    case floorLevelChangeDirection = "FLOOR_LEVEL_CHANGE_DIRECTION"
    case floorLevelDifference = "FLOOR_LEVEL_DIFFERENCE"
    case indoorType = "INDOOR_TYPE"
    case outdoorType = "OUTDOOR_TYPE"
    case trackIlluminated = "TRACK_ILLUMINATED"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.floorLevelChangeDirection = try container.decodeIfPresent(String.self, forKey: .floorLevelChangeDirection)
    self.floorLevelDifference = try container.decodeIfPresent(String.self, forKey: .floorLevelDifference)
    self.indoorType = try container.decodeIfPresent(String.self, forKey: .indoorType)
    
    do {
      self.outdoorType = try container.decodeIfPresent([String].self, forKey: .outdoorType)
    } catch {
      guard let outdoorType = try container.decodeIfPresent(String.self, forKey: .outdoorType) else { throw error }
      self.outdoorType = [outdoorType]
    }
    
    self.trackIlluminated = try container.decodeIfPresent(String.self, forKey: .trackIlluminated)
  }
}
