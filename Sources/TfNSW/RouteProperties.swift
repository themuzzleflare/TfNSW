import Foundation

public struct RouteProperties: Decodable {
  public let isTTB: Bool?
  
  /// This is an ID for this journey option.
  public let tripCode: Int?
  
  public let timetablePeriod: String?
  
  public let specialFares: String?
  
  public let lineDisplay: String?
  
  public let AVMSTripID: String?
  
  public let RealtimeTripId: String?
  
  public let FrequencyLine: String?
}
