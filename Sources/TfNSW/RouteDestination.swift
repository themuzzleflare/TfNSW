import Foundation

public struct RouteDestination: Decodable {
  public var name: String? // This is the name of the destination for this route.
  public var type: LocationType?
}
