import Foundation

public enum IconID: Int, Decodable {
  /// Sydney Trains.
  case sydneyTrains = 1
  
  /// Intercity Trains.
  case intercityTrains = 2
  
  /// Regional Trains.
  case regionalTrains = 3
  
  /// Blue Mountains Buses.
  case blueMountainsBuses = 4
  
  /// Sydney Buses.
  case sydneyBuses = 5
  
  /// Central Coast Buses.
  case centralCoastBuses = 6
  
  /// Regional Coaches.
  case regionalCoaches = 7
  
  /// School Buses.
  case schoolBuses = 8
  
  /// Private Buses.
  case privateBuses = 9
  
  /// Sydney Ferries.
  case sydneyFerries = 10
  
  /// Newcastle Ferries.
  case newcastleFerries = 11
  
  /// Private Ferries.
  case privateFerries = 12
  
  /// Sydney Light Rail.
  case sydneyLightRail = 13
  
  /// Temporary Buses.
  case temporaryBuses = 14
  
  /// Hunter Buses.
  case hunterBuses = 15
  
  /// Illawarra Buses.
  case illawarraBuses = 16
  
  /// Private Coaches.
  case privateCoaches = 17
  
  /// Temporary Ferries.
  case temporaryFerries = 18
  
  /// Temporary Trains.
  case temporaryTrains = 19
  
  /// Temporary Light Rail.
  case temporaryLightRail = 20
  
  /// Newcastle Light Rail.
  case newcastleLightRail = 21
  
  /// Temporary Coaches.
  case temporaryCoaches = 22
  
  case walkingFootpath = 100
}

public extension IconID {
  /// The `ProductClass` associated with the `IconID`.
  var productClass: ProductClass {
    switch self {
    case .sydneyTrains, .intercityTrains, .regionalTrains, .temporaryTrains:
      return .train
    case .sydneyLightRail, .temporaryLightRail, .newcastleLightRail:
      return .lightRail
    case .blueMountainsBuses, .sydneyBuses, .centralCoastBuses, .temporaryBuses, .hunterBuses, .illawarraBuses, .privateBuses, .privateCoaches:
      return .bus
    case .regionalCoaches, .temporaryCoaches:
      return .coach
    case .sydneyFerries, .newcastleFerries, .privateFerries, .temporaryFerries:
      return .ferry
    case .schoolBuses:
      return .schoolBus
    case .walkingFootpath:
      return .walkingFootpath
    }
  }
}
