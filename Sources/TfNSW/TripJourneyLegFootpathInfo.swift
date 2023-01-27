import Foundation

public typealias TripJourneyLegFootpathInfo = TripJourney.Leg.FootpathInfo

public extension TripJourney.Leg {
  struct FootpathInfo: Decodable {
    /// This indicates where in the leg the walking part of this legs occurs, since for some legs this is included with transportation on a vehicle.
    public let position: FootpathInfoPosition?
    
    /// This is approximately how long in seconds the walking instructions contained in this element take to perform.
    public let duration: Int?
    
    /// This describes the specific instructions for the walking leg.
    public let footPathElem: [FootpathElem]?
  }
}
