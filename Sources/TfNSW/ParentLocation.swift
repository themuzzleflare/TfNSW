import Foundation

public struct ParentLocation: Decodable {
  public var isGlobalId: Bool?

  /// This is a unique ID for the returned location. Certain types of ID can be used for subsequent searches performed with `stop_finder`, or can be used as the origin or destination in an `trip` request. The format of a location ID differs greatly, depending on the type of location it is.
  public var id: String?

  /// This is the long version of the location name, which may include the suburb or other information.
  @StopName public var name: String?

  /// This is the short version of the location name, which does not include the suburb or other information.
  @StopName public var disassembledName: String?

  /// This is the type of location being returned. It may represent a stop or platform that a public transport service physically stops at for passenger boarding, or it may represent somebody's house. A value of `unknown` likely indicates bad data coming from the server. If a location is returned with this type, you can safely ignore it. = ['poi', 'singlehouse', 'stop', 'platform', 'street', 'locality', 'suburb', 'unknown'].
  public var type: LocationType?

  /// In some cases, a parent location will also contain its parent (in other words, the grandparent of the initial location).
  public var parent: GrandparentLocation?

  public var properties: ParentProperties?
}
