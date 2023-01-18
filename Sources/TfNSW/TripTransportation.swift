import Foundation

public struct TripTransportation: Decodable {
  /// This is an ID that uniquely identifies this route.
  public let id: String?
  
  /// This contains the full name of the route.
  public let name: String?
  
  /// Contains a very short name for the route.
  public let disassembledName: String?
  
  /// Contains a short name for the route.
  public let number: String?
  
  /// Contains a description of this route.
  public let description: String?
  
  /// This element contains additional properties about the route.
  public let product: RouteProduct?
  
  /// This element describes the operator of this route.
  public let `operator`: RouteOperator?
  
  /// This element contains information about where vehicles on this route terminate.
  public let destination: RouteDestination?
  
  /// Contains additional properties about this route.
  public let properties: RouteProperties?
  
  public let routeColour: String?
}
