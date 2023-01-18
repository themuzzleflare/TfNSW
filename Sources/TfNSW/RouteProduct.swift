import Foundation

public struct RouteProduct: Decodable {
  public let id: DIVATransportID?
  
  /// This field indicates the type of the route, using the same values as elsewhere in this API.
  public let `class`: ProductClass?
  
  /// Name of the product.
  public let name: String?
  
  /// This field is used by to determine which icon to use when displaying this affected route. It will typically match up with the `class` value.
  public let iconId: IconID?
}
