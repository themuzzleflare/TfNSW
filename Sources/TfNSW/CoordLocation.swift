import Foundation
import CoreLocation

public struct CoordLocation: Decodable {
  public let id: String
  
  public let isGlobalId: Bool?
  
  @StopName public var name: String?
  
  @StopName public var disassembledName: String?
  
  public let type: LocationType?
  
  public let coord: [CLLocationDegrees]?
  
  public let properties: Properties?
  
  enum CodingKeys: CodingKey {
    case id
    case isGlobalId
    case name
    case disassembledName
    case type
    case coord
    case properties
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(String.self, forKey: .id)
    self.isGlobalId = try container.decodeIfPresent(Bool.self, forKey: .isGlobalId)
    self._name.wrappedValue = try container.decodeIfPresent(String.self, forKey: .name)
    self._disassembledName.wrappedValue = try container.decodeIfPresent(String.self, forKey: .disassembledName)
    self.type = try container.decodeIfPresent(LocationType.self, forKey: .type)
    self.coord = try container.decodeIfPresent([CLLocationDegrees].self, forKey: .coord)
    self.properties = try container.decodeIfPresent(Properties.self, forKey: .properties)
  }
}

public extension CoordLocation {
  struct Properties: Decodable {
    public let distance: CLLocationDistance?
    
    public let stopGlobalId: String?
    
    public let stopPointGlobalId: String?
    
    public let stopNameWithPlace: String?
    
    public let stopAreaName: String?
    
    public let stopPointReferredName: String?
    
    public let stopPointReferredNameWithPlace: String?
    
    public let identifier: String?
    
    enum CodingKeys: String, CodingKey {
      case distance
      case stopGlobalId = "STOP_GLOBAL_ID"
      case stopPointGlobalId = "STOPPOINT_GLOBAL_ID"
      case stopNameWithPlace = "STOP_NAME_WITH_PLACE"
      case stopAreaName = "STOP_AREA_NAME"
      case stopPointReferredName = "STOP_POINT_REFERED_NAME"
      case stopPointReferredNameWithPlace = "STOP_POINT_REFERED_NAMEWITHPLACE"
      case identifier = "IDENTIFIER"
    }
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.distance = try container.decodeIfPresent(CLLocationDistance.self, forKey: .distance)
      self.stopGlobalId = try container.decodeIfPresent(String.self, forKey: .stopGlobalId)
      self.stopPointGlobalId = try container.decodeIfPresent(String.self, forKey: .stopPointGlobalId)
      self.stopNameWithPlace = try container.decodeIfPresent(String.self, forKey: .stopNameWithPlace)
      self.stopAreaName = try container.decodeIfPresent(String.self, forKey: .stopAreaName)
      self.stopPointReferredName = try container.decodeIfPresent(String.self, forKey: .stopPointReferredName)
      self.stopPointReferredNameWithPlace = try container.decodeIfPresent(String.self, forKey: .stopPointReferredNameWithPlace)
      self.identifier = try container.decodeIfPresent(String.self, forKey: .identifier)
    }
  }
}
