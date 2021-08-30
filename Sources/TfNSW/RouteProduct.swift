import Foundation

public struct RouteProduct: Decodable {
  public var id: Int?
  public var `class`: ProductClass? // This field indicates the type of the route, using the same values as elsewhere in this API.
  public var name: String? // Name of the product.
  public var iconId: IconID? // This field is used by to determine which icon to use when displaying this affected route. It will typically match up with the class value.
}
