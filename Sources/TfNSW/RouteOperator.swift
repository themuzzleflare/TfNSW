import Foundation

public struct RouteOperator: Decodable {
  /// Contains a unique identifier for the given operator.
  public var id: String?
  
  /// Contains the name of the operator of the route.
  public var name: String?
}
