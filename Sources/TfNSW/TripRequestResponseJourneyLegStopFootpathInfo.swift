import Foundation

public struct TripRequestResponseJourneyLegStopFootpathInfo: Decodable {
  /// This indicates where in the leg the walking part of this legs occurs, since for some legs this is included with transportation on a vehicle.
  public var position: FootpathInfoPosition?
  
  /// This is approximately how long in seconds the walking instructions contained in this element take to perform.
  public var duration: Int?
  
  /// This describes the specific instructions for the walking leg.
  public var footPathElem: [TripRequestResponseJourneyLegStopFootpathInfoFootpathElem]?
}
