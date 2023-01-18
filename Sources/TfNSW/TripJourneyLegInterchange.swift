import Foundation
import CoreLocation

public extension TripJourney.Leg {
  struct Interchange: Decodable {
    /// This is a description of the interchange.
    public let desc: String?
    
    /// This indicates the mode of travel for the interchange. Both `99` and `100` indicate walking. = ['99', '100'].
    public let type: ProductClass?
    
    /// This is a list of coordinates that makes up the path of the interchange.
    public let coords: [[CLLocationDegrees]]?
  }
}
