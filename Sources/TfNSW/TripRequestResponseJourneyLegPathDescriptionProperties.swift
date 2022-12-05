import Foundation

public struct TripRequestResponseJourneyLegPathDescriptionProperties: Decodable {
  public var floorLevelChangeDirection: String?
  
  public var floorLevelDifference: String?
  
  public var indoorType: String?
  
  public var outdoorType: [String]?
  
  public var trackIlluminated: String?
  
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
    
    if let itype = try? container.decodeIfPresent([String].self, forKey: .outdoorType) {
      self.outdoorType = itype
    } else if let itype = try? container.decodeIfPresent(String.self, forKey: .outdoorType) {
      self.outdoorType = [itype]
    }
    
    self.trackIlluminated = try container.decodeIfPresent(String.self, forKey: .trackIlluminated)
  }
}
