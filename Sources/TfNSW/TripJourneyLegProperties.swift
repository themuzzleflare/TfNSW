import Foundation

public typealias TripJourneyLegProperties = TripJourney.Leg.Properties

public extension TripJourney.Leg {
  struct Properties: Decodable {
    public let vehicleAccess: [String]?
    
    public let lineType: [String]?
    
    public let differentFares: BooleanEnum?
    
    /// This indicates whether or not the vehicle is wheelchair accessible.
    public let planLowFloorVehicle: BooleanEnum?
    
    /// This indicates whether or not the stop is wheelchair accessible.
    public let planWheelchairAccess: BooleanEnum?
    
    enum CodingKeys: String, CodingKey {
      case vehicleAccess
      case lineType
      case differentFares = "DIFFERENT_FARES"
      case planLowFloorVehicle = "PlanLowFloorVehicle"
      case planWheelchairAccess = "PlanWheelChairAccess"
    }
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.vehicleAccess = try container.decodeIfPresent([String].self, forKey: .vehicleAccess)
      self.lineType = try container.decodeIfPresent([String].self, forKey: .lineType)
      self.differentFares = try container.decodeIfPresent(BooleanEnum.self, forKey: .differentFares)
      self.planLowFloorVehicle = try container.decodeIfPresent(BooleanEnum.self, forKey: .planLowFloorVehicle)
      self.planWheelchairAccess = try container.decodeIfPresent(BooleanEnum.self, forKey: .planWheelchairAccess)
    }
  }
}

public extension TripJourney.Leg.Properties {
  var isWheelchairAccessible: Bool? {
    return planLowFloorVehicle == .oneValue && planWheelchairAccess == .oneValue
  }
}
