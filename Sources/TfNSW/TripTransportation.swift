import Foundation

public struct TripTransportation: Decodable {
  public var id: String? // This is an ID that uniquely identifies this route.
  public var name: String? // This contains the full name of the route.
  public var disassembledName: String? // Contains a very short name for the route.
  public var number: String? // Contains a short name for the route.
  public var description: String? // Contains a description of this route.
  public var product: RouteProduct? // This element contains additional properties about the route.
  public var `operator`: RouteOperator? // This element describes the operator of this route.
  public var destination: RouteDestination? // This element contains information about where vehicles on this route terminate.
  public var properties: RouteProperties? // Contains additional properties about this route.
}
