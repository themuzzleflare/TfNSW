import Foundation

public enum IconID: Int, Decodable {
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
}

extension IconID {
  /// The `ProductClass` associated with the `IconID`.
  public var productClass: ProductClass {
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
    }
  }
}
