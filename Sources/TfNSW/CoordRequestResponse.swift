import Foundation

public struct CoordRequestResponse: Decodable {
  public let version: String?
  
  public let locations: [CoordLocation]
}
