import Foundation

public enum DIVATransportID: Int, Decodable {
  case sydneyTrains = 1
  case intercityTrains = 2
  case regionalTrains = 3
  case blueMountainsBuses = 4
  case sydneyBuses = 5
  case centralCoastBuses = 6
  case regionalCoaches = 7
  case schoolBuses = 8
  case privateBuses = 9
  case sydneyFerries = 10
  case newcastleFerries = 11
  case privateFerries = 12
  case sydneyLightRail = 13
  case temporaryBuses = 14
  case hunterBuses = 15
  case illawarraBuses = 16
  case privateCoaches = 17
  case temporaryFerries = 18
  case temporaryTrains = 19
  case temporaryLightRail = 20
  case newcastleLightRail = 21
  case temporaryCoaches = 22
  case onDemand = 23
  case sydneyMetro = 24
}

extension DIVATransportID: CustomStringConvertible {
  public var description: String {
    switch self {
    case .sydneyTrains:
      return "Sydney Trains Network"
    case .intercityTrains:
      return "Intercity Trains"
    case .regionalTrains:
      return "Regional Trains and Coaches Network"
    case .blueMountainsBuses:
      return "Blue Mountains Buses Network"
    case .sydneyBuses:
      return "Sydney Buses Network"
    case .centralCoastBuses:
      return "Central Coast Buses Network"
    case .regionalCoaches:
      return "Regional Trains and Coaches Network"
    case .schoolBuses:
      return "School Buses"
    case .privateBuses:
      return "Private bus services"
    case .sydneyFerries:
      return "Sydney Ferries Network"
    case .newcastleFerries:
      return "Newcastle Ferries"
    case .privateFerries:
      return "Private ferry and fast ferry services"
    case .sydneyLightRail:
      return "Sydney Light Rail Network"
    case .temporaryBuses:
      return "Temporary buses"
    case .hunterBuses:
      return "Hunter Buses Network"
    case .illawarraBuses:
      return "Illawarra Buses Network"
    case .privateCoaches:
      return "Private coach services"
    case .temporaryFerries:
      return "Temporary ferries"
    case .temporaryTrains:
      return "Temporary trains"
    case .temporaryLightRail:
      return "Temporary light rail"
    case .newcastleLightRail:
      return "Newcastle Light Rail Network"
    case .temporaryCoaches:
      return "Temporary coaches"
    case .onDemand:
      return "On demand"
    case .sydneyMetro:
      return "Sydney Metro Network"
    }
  }
}

public extension DIVATransportID {
  var gtfsRouteType: GTFSRouteType {
    switch self {
    case .sydneyLightRail, .temporaryLightRail, .newcastleLightRail:
      return .lightRail
    case .sydneyTrains, .intercityTrains, .temporaryTrains:
      return .rail
    case .sydneyFerries, .newcastleFerries, .privateFerries, .temporaryFerries:
      return .ferry
    case .regionalTrains:
      return .regionalRail
    case .temporaryCoaches:
      return .shuttleCoach
    case .regionalCoaches:
      return .regionalCoach
    case .sydneyMetro:
      return .metro
    case .blueMountainsBuses, .sydneyBuses, .centralCoastBuses, .privateBuses, .hunterBuses, .illawarraBuses, .privateCoaches:
      return .bus
    case .schoolBuses:
      return .schoolBus
    case .temporaryBuses:
      return .railReplacementBus
    case .onDemand:
      return .demandAndResponseBus
    }
  }
  
  var productClass: ProductClass {
    switch self {
    case .sydneyTrains, .intercityTrains, .regionalTrains, .temporaryTrains:
      return .train
    case .blueMountainsBuses, .sydneyBuses, .centralCoastBuses, .privateBuses, .temporaryBuses, .hunterBuses, .illawarraBuses, .onDemand:
      return .bus
    case .regionalCoaches, .privateCoaches, .temporaryCoaches:
      return .coach
    case .schoolBuses:
      return .schoolBus
    case .sydneyFerries, .newcastleFerries, .privateFerries, .temporaryFerries:
      return .ferry
    case .sydneyLightRail, .temporaryLightRail, .newcastleLightRail:
      return .lightRail
    case .sydneyMetro:
      return .metro
    }
  }
  
  var iconId: IconID {
    switch self {
    case .sydneyTrains:
      return .sydneyTrains
    case .intercityTrains:
      return .intercityTrains
    case .regionalTrains:
      return .regionalTrains
    case .blueMountainsBuses:
      return .blueMountainsBuses
    case .sydneyBuses, .onDemand:
      return .sydneyBuses
    case .centralCoastBuses:
      return .centralCoastBuses
    case .regionalCoaches:
      return .regionalCoaches
    case .schoolBuses:
      return .schoolBuses
    case .privateBuses:
      return .privateBuses
    case .sydneyFerries:
      return .sydneyFerries
    case .newcastleFerries:
      return .newcastleFerries
    case .privateFerries:
      return .privateFerries
    case .sydneyLightRail:
      return .sydneyLightRail
    case .temporaryBuses:
      return .temporaryBuses
    case .hunterBuses:
      return .hunterBuses
    case .illawarraBuses:
      return .illawarraBuses
    case .privateCoaches:
      return .privateCoaches
    case .temporaryFerries:
      return .temporaryFerries
    case .temporaryTrains:
      return .temporaryTrains
    case .temporaryLightRail:
      return .temporaryLightRail
    case .newcastleLightRail:
      return .newcastleLightRail
    case .temporaryCoaches:
      return .temporaryCoaches
    case .sydneyMetro:
      return .intercityTrains
    }
  }
}
