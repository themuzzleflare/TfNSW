import Foundation

public struct JourneyLegProperties: Decodable {
  public var PlanLowFloorVehicle: BooleanEnum? // This indicates whether or not the vehicle is wheelchair accessible.
  public var PlanWheelChairAccess: BooleanEnum? // This indicates whether or not the stop is wheelchair accessible.
}
