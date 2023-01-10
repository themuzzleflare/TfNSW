import Foundation

public struct TripRequestResponseJourneyLegHint: Decodable {
  public let content: String?
  public let providerCode: String?
  public let type: String?
  public let properties: Properties?
  
  public struct Properties: Decodable {
    public let subnet: String?
  }
}
