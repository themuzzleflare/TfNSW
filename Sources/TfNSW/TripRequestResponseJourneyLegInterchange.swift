import Foundation
import CoreLocation

public struct TripRequestResponseJourneyLegInterchange: Decodable {
  /// This is a description of the interchange.
  public var desc: String?

  /// This indicates the mode of travel for the interchange. Both `99` and `100` indicate walking. = ['99', '100'].
  public var type: ProductClass?

  /// This is a list of coordinates that makes up the path of the interchange.
  public var coords: [[CLLocationDegrees]]?
}

#if os(macOS)

import Vapor

extension TripRequestResponseJourneyLegInterchange: Content {}

#endif
