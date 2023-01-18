import Foundation

public enum GTFSRouteType: Int, Decodable {
  /// Light rail
  case lightRail = 0
  
  /// Rail
  case rail = 2
  
  /// Ferry
  case ferry = 4
  
  /// Regional Rail Service
  case regionalRail = 106
  
  /// Shuttle Coach Service
  case shuttleCoach = 203
  
  /// Regional Coach Service
  case regionalCoach = 204
  
  /// Metro Service
  case metro = 401
  
  /// Bus Service
  case bus = 700
  
  /// School Bus
  case schoolBus = 712
  
  /// Rail Replacement Bus Service
  case railReplacementBus = 714
  
  /// Demand and Response Bus Service
  case demandAndResponseBus = 715
}

extension GTFSRouteType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .lightRail:
      return "Light rail"
    case .rail:
      return "Rail"
    case .ferry:
      return "Ferry"
    case .regionalRail:
      return "Regional Rail Service"
    case .shuttleCoach:
      return "Shuttle Coach Service"
    case .regionalCoach:
      return "Regional Coach Service"
    case .metro:
      return "Metro Service"
    case .bus:
      return "Bus Service"
    case .schoolBus:
      return "School Bus"
    case .railReplacementBus:
      return "Rail Replacement Bus Service"
    case .demandAndResponseBus:
      return "Demand and Response Bus Service"
    }
  }
}
