import Foundation

public struct JourneyLegProperties: Decodable {
  public let vehicleAccess: [String]?
  
  public let lineType: [String]?
  
  public let DIFFERENT_FARES: BooleanEnum?
  
  /// This indicates whether or not the vehicle is wheelchair accessible.
  public let PlanLowFloorVehicle: BooleanEnum?
  
  /// This indicates whether or not the stop is wheelchair accessible.
  public let PlanWheelChairAccess: BooleanEnum?
}
