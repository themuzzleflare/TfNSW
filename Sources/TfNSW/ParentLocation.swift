import Foundation
import CoreLocation

public struct ParentLocation: Decodable {
  public let isGlobalId: Bool?
  
  /// This is a unique ID for the returned location. Certain types of ID can be used for subsequent searches performed with `stop_finder`, or can be used as the origin or destination in an `trip` request. The format of a location ID differs greatly, depending on the type of location it is.
  public let id: String?
  
  /// This is the long version of the location name, which may include the suburb or other information.
  @StopName public var name: String?
  
  /// This is the short version of the location name, which does not include the suburb or other information.
  @StopName public var disassembledName: String?
  
  /// This is the type of location being returned. It may represent a stop or platform that a public transport service physically stops at for passenger boarding, or it may represent somebody's house. A value of `unknown` likely indicates bad data coming from the server. If a location is returned with this type, you can safely ignore it. = ['poi', 'singlehouse', 'stop', 'platform', 'street', 'locality', 'suburb', 'unknown'].
  public let type: LocationType?
  
  /// In some cases, a parent location will also contain its parent (in other words, the grandparent of the initial location).
  public let parent: GrandparentLocation?
  
  public let properties: ParentProperties?
  
  public let coord: [CLLocationDegrees]?
  
  public let niveau: Int?
  
  enum CodingKeys: CodingKey {
    case isGlobalId, id, name, disassembledName, type, parent, properties, coord, niveau
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.isGlobalId = try container.decodeIfPresent(Bool.self, forKey: .isGlobalId)
    self.id = try container.decodeIfPresent(String.self, forKey: .id)
    self._name.wrappedValue = try container.decodeIfPresent(String.self, forKey: .name)
    self._disassembledName.wrappedValue = try container.decodeIfPresent(String.self, forKey: .disassembledName)
    self.type = try container.decodeIfPresent(LocationType.self, forKey: .type)
    self.parent = try container.decodeIfPresent(GrandparentLocation.self, forKey: .parent)
    self.properties = try container.decodeIfPresent(ParentProperties.self, forKey: .properties)
    self.coord = try container.decodeIfPresent([CLLocationDegrees].self, forKey: .coord)
    self.niveau = try container.decodeIfPresent(Int.self, forKey: .niveau)
  }
}
