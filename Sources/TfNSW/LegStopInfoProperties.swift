import Foundation

public struct LegStopInfoProperties: Decodable, Equatable {
  public let publisher: String?
  
  public let infoType: String?
  
  public let appliesTo: String?
  
  public let stopIDglobalID: String?
}
