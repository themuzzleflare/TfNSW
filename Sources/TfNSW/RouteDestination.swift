import Foundation

public struct RouteDestination: Decodable {
  /// This is the name of the destination for this route.
  public var name: String?
  
  public var type: LocationType?
}

#if os(macOS)

import Vapor

extension RouteDestination: Content {}

#endif
