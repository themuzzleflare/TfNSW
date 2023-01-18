import Foundation

public struct RouteRequest: Decodable {
  public let routes: [Route]
  
  enum CodingKeys: String, CodingKey {
    case routes = "ROUTE"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.routes = try container.decode([Route].self, forKey: .routes)
  }
  
  public struct Route: Decodable {
    public let gtfsAlertsName: String
    public let gtfsAlertsId: String
    
    public let gtfsAgencyId: String
    
    public let gtfsRouteIdOut: String
    public let gtfsRouteIdIn: String
    
    public let transportName: String
    public let transportNameId: String
    
    public let operatorId: String
    public let operatorName: String
    
    public let efaRouteName: String
    
    public let textColour: String
    public let backgroundColour: String
    public let foregroundColour: String
    
    public let frequencyRoute: String
    
    enum CodingKeys: String, CodingKey {
      case gtfsAlertsName = "gtfs_alerts_name"
      case gtfsAlertsId = "gtfs_alerts_id"
      case gtfsAgencyId = "gtfs_agency_id"
      case gtfsRouteIdOut = "gtfs_route_id_out"
      case gtfsRouteIdIn = "gtfs_route_id_in"
      case transportName = "transport_name"
      case transportNameId = "transport_name_id"
      case operatorId = "operator_id"
      case operatorName = "operator_name"
      case efaRouteName = "efa_route_name"
      case textColour = "text_colour"
      case backgroundColour = "background_colour"
      case foregroundColour = "foreground_colour"
      case frequencyRoute = "frequency_route"
    }
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.gtfsAlertsName = try container.decode(String.self, forKey: .gtfsAlertsName)
      self.gtfsAlertsId = try container.decode(String.self, forKey: .gtfsAlertsId)
      self.gtfsAgencyId = try container.decode(String.self, forKey: .gtfsAgencyId)
      self.gtfsRouteIdOut = try container.decode(String.self, forKey: .gtfsRouteIdOut)
      self.gtfsRouteIdIn = try container.decode(String.self, forKey: .gtfsRouteIdIn)
      self.transportName = try container.decode(String.self, forKey: .transportName)
      self.transportNameId = try container.decode(String.self, forKey: .transportNameId)
      self.operatorId = try container.decode(String.self, forKey: .operatorId)
      self.operatorName = try container.decode(String.self, forKey: .operatorName)
      self.efaRouteName = try container.decode(String.self, forKey: .efaRouteName)
      self.textColour = try container.decode(String.self, forKey: .textColour)
      self.backgroundColour = try container.decode(String.self, forKey: .backgroundColour)
      self.foregroundColour = try container.decode(String.self, forKey: .foregroundColour)
      self.frequencyRoute = try container.decode(String.self, forKey: .frequencyRoute)
    }
  }
}
