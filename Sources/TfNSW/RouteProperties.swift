import Foundation

public struct RouteProperties: Decodable {
  public var isTTB: Bool?
  public var tripCode: Int? // This is an ID for this journey option.
  public var timetablePeriod: String?
  public var lineDisplay: String?
  public var RealtimeTripId: String?
  public var FrequencyLine: String?
}
