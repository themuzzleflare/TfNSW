import Foundation

public struct TripTransportation: Decodable {
  /// This is an ID that uniquely identifies this route.
  public var id: String?

  /// This contains the full name of the route.
  public var name: String?

  /// Contains a very short name for the route.
  public var disassembledName: String?

  /// Contains a short name for the route.
  public var number: String?

  /// Contains a description of this route.
  public var description: String?

  /// This element contains additional properties about the route.
  public var product: RouteProduct?

  /// This element describes the operator of this route.
  public var `operator`: RouteOperator?

  /// This element contains information about where vehicles on this route terminate.
  public var destination: RouteDestination?

  /// Contains additional properties about this route.
  public var properties: RouteProperties?
}
