import Foundation

public extension TripJourney.Leg.Stop {
  struct Properties: Decodable {
    public let stopId: String?
    
    /// Describes a list of downloadable files relevant to this location.
    public let downloads: [TripRequestResponseJourneyLegStopDownload]?
    
    /// Indicates if there is wheelchair access available at this stop. = ['true', 'false'].
    public let wheelchairAccess: BooleanEnum?
    
    public let areaNiveauDiva: String?
    
    public let areaNiveauGis: String?
    
    public let pbyb: String?
    
    public let occupancy: LegStopOccupancy?
    
    public let realtimeStatus: [String]?
    
    /// The total number of cars included in the train consist for the trip in question.
    public let numberOfCars: String?
    
    /// The first car in which the customer can travel in order to be able to alight at their destination without needing to move to a different part of the train.
    public let travelInCarsFrom: String?
    
    /// The last car in which the customer can travel in order to be able to alight at their destination without needing to move to a different part of the train.
    public let travelInCarsTo: String?
    
    /// Text description of where the customer can travel, e.g. ‘any’, ‘middle 2’, ‘first 6’, ‘last 4’.
    public let travelInCarsMessage: String?
    
    public let areaGid: String?
    
    public let area: String?
    
    public let platform: String?
    
    enum CodingKeys: String, CodingKey {
      case stopId, downloads
      case wheelchairAccess = "WheelchairAccess"
      case areaNiveauDiva = "AREA_NIVEAU_DIVA"
      case areaNiveauGis = "AREA_NIVEAU_GIS"
      case pbyb, occupancy, realtimeStatus
      case numberOfCars = "NumberOfCars"
      case travelInCarsFrom = "TravelInCarsFrom"
      case travelInCarsTo = "TravelInCarsTo"
      case travelInCarsMessage = "TravelInCarsMessage"
      case areaGid, area, platform
    }
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.stopId = try container.decodeIfPresent(String.self, forKey: .stopId)
      self.downloads = try container.decodeIfPresent([TripRequestResponseJourneyLegStopDownload].self, forKey: .downloads)
      self.wheelchairAccess = try container.decodeIfPresent(BooleanEnum.self, forKey: .wheelchairAccess)
      self.areaNiveauDiva = try container.decodeIfPresent(String.self, forKey: .areaNiveauDiva)
      self.areaNiveauGis = try container.decodeIfPresent(String.self, forKey: .areaNiveauGis)
      self.pbyb = try container.decodeIfPresent(String.self, forKey: .pbyb)
      self.occupancy = try container.decodeIfPresent(LegStopOccupancy.self, forKey: .occupancy)
      self.realtimeStatus = try container.decodeIfPresent([String].self, forKey: .realtimeStatus)
      self.numberOfCars = try container.decodeIfPresent(String.self, forKey: .numberOfCars)
      self.travelInCarsFrom = try container.decodeIfPresent(String.self, forKey: .travelInCarsFrom)
      self.travelInCarsTo = try container.decodeIfPresent(String.self, forKey: .travelInCarsTo)
      self.travelInCarsMessage = try container.decodeIfPresent(String.self, forKey: .travelInCarsMessage)
      self.areaGid = try container.decodeIfPresent(String.self, forKey: .areaGid)
      self.area = try container.decodeIfPresent(String.self, forKey: .area)
      self.platform = try container.decodeIfPresent(String.self, forKey: .platform)
    }
  }
}
