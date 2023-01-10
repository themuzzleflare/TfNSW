import Foundation

public struct RouteDestination: Decodable {
  public let id: String?
  
  /// This is the name of the destination for this route.
  public let name: String?
  
  public let type: LocationType?
}
