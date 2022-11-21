import Foundation
import UIKit

public enum ProductClass: Int, Decodable {
  /// Train.
  case train = 1
  
  /// Metro.
  case metro = 2
  
  /// Light Rail.
  case lightRail = 4
  
  /// Bus.
  case bus = 5
  
  /// Coach.
  case coach = 7
  
  /// Ferry.
  case ferry = 9
  
  /// School Bus.
  case schoolBus = 11
  
  /// Walking.
  case walking = 99
  
  /// Walking (Footpath).
  case walkingFootpath = 100
  
  /// Bicycle.
  case bicycle = 101
  
  /// Take Bicycle On Public Transport.
  case takeBicycleOnPublicTransport = 102
  
  /// Kiss & Ride.
  case kissAndRide = 103
  
  /// Park & Ride.
  case parkAndRide = 104
  
  /// Taxi.
  case taxi = 105
  
  /// Car.
  case car = 106
}

extension ProductClass {
  /// The custom description of the `ProductClass`.
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
  
  /// The colour associated with the `ProductClass`.
  public var colour: UIColor {
    switch self {
    case .train:
      return .train
    case .metro:
      return .metro
    case .bus:
      return .bus
    case .lightRail:
      return .lightRail
    case .ferry:
      return .ferry
    default:
      return .accent
    }
  }
}
