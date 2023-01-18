import Foundation

public struct RouteProperties: Decodable {
  public let isTTB: Bool?
  
  /// This is an ID for this journey option.
  public let tripCode: Int?
  
  public let timetablePeriod: String?
  
  public let specialFares: String?
  
  public let lineDisplay: String?
  
  public let avmsTripId: String?
  
  public let realtimeTripId: String?
  
  public let frequencyLine: String?
  
  enum CodingKeys: String, CodingKey {
    case isTTB, tripCode, timetablePeriod, specialFares, lineDisplay
    case avmsTripId = "AVMSTripID"
    case realtimeTripId = "RealtimeTripId"
    case frequencyLine = "FrequencyLine"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.isTTB = try container.decodeIfPresent(Bool.self, forKey: .isTTB)
    self.tripCode = try container.decodeIfPresent(Int.self, forKey: .tripCode)
    self.timetablePeriod = try container.decodeIfPresent(String.self, forKey: .timetablePeriod)
    self.specialFares = try container.decodeIfPresent(String.self, forKey: .specialFares)
    self.lineDisplay = try container.decodeIfPresent(String.self, forKey: .lineDisplay)
    self.avmsTripId = try container.decodeIfPresent(String.self, forKey: .avmsTripId)
    self.realtimeTripId = try container.decodeIfPresent(String.self, forKey: .realtimeTripId)
    self.frequencyLine = try container.decodeIfPresent(String.self, forKey: .frequencyLine)
  }
}
