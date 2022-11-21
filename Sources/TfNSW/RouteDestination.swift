import Foundation

public struct RouteDestination: Decodable {
  public var id: String?
  
  /// This is the name of the destination for this route.
  public var name: String?
  
  public var type: LocationType?
}
