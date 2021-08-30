import Foundation

public enum ProductClass: Int, Decodable {
  case train = 1
  case metro = 2
  case lightRail = 4
  case bus = 5
  case coach = 7
  case ferry = 9
  case schoolBus = 11
  case walking = 99
  case walkingFootpath = 100
  case bicycle = 101
  case takeBicycleOnPublicTransport = 102
  case kissAndRide = 103
  case parkAndRide = 104
  case taxi = 105
  case car = 106
}

extension ProductClass {
  public var description: String {
    switch self {
    case .train:
      return "Train"
    case .metro:
      return "Metro"
    case .lightRail:
      return "Light Rail"
    case .bus:
      return "Bus"
    case .coach:
      return "Coach"
    case .ferry:
      return "Ferry"
    case .schoolBus:
      return "School Bus"
    case .walking:
      return "Walking"
    case .walkingFootpath:
      return "Walking (Footpath)"
    case .bicycle:
      return "Bicycle"
    case .takeBicycleOnPublicTransport:
      return "Take Bicycle On Public Transport"
    case .kissAndRide:
      return "Kiss & Ride"
    case .parkAndRide:
      return "Park & Ride"
    case .taxi:
      return "Taxi"
    case .car:
      return "Car"
    }
  }
}
