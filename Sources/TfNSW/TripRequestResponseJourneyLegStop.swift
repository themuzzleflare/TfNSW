import Foundation
import SwiftDate

public struct TripRequestResponseJourneyLegStop: Decodable, Identifiable {
  public var isGlobalId: Bool?
  public var id: String? // This is a unique ID for the returned location. Certain types of ID can be used for subsequent searches performed with stop_finder, or can be used as the origin or destination in an trip request. The format of a location ID differs greatly, depending on the type of location it is.
  public var name: String? // This is the long version of the location name, which may include the suburb or other information.
  public var disassembledName: String? // This is the short version of the location name, which does not include the suburb or other information.
  public var type: LocationType? // This is the type of location being returned. It will typically represent a specific stop or platform. = ['poi', 'singlehouse', 'stop', 'platform', 'street', 'locality', 'suburb', 'unknown'].
  public var coord: [Double]? // Contains exactly two values: the first value is the latitude, the second value is the longitude.
  public var niveau: Int?
  public var parent: ParentLocation? // If available, contains information about this location's parent location. For example, if the stop has a type of platform, then this field may contain information about the station in which the platform is located.
  public var productClasses: [ProductClass]?
  public var departureTimePlanned: String? // A timestamp in YYYY-MM-DDTHH:MM:SSZ format that indicates the planned departure time. This is the original scheduled time.
  public var departureTimeEstimated: String? // A timestamp in YYYY-MM-DDTHH:MM:SSZ format that indicates the estimated departure time. If real-time information is available then this timestamp is the real-time estimate, otherwise it is the same as the value in departureTimePlanned.
  public var arrivalTimePlanned: String? // A timestamp in YYYY-MM-DDTHH:MM:SSZ format that indicates the planned arrival time. This is the original scheduled time.
  public var arrivalTimeEstimated: String? // A timestamp in YYYY-MM-DDTHH:MM:SSZ format that indicates the estimated arrival time. If real-time information is available then this timestamp is the real-time estimate, otherwise it is the same as the value in arrivalTimePlanned.
  public var properties: LegStopProperties? // Contains additional information about this stop, such as wheelchair accessibility information.
}

extension TripRequestResponseJourneyLegStop {
  public var shortNamePlatform: String? {
    return disassembledName?.replacingOccurrences(of: " Station", with: "")
  }
  public var shortName: String? {
    return disassembledName?.replacingOccurrences(of: " Station", with: "").split(separator: ",").dropLast().joined()
  }
  public var departureTimeText: String? {
    return departureTimeEstimated?.toDate()?.toString(.time(.short)) ?? departureTimePlanned?.toDate()?.toString(.time(.short))
  }
  public var arrivalTimeText: String? {
    return arrivalTimeEstimated?.toDate()?.toString(.time(.short)) ?? arrivalTimePlanned?.toDate()?.toString(.time(.short))
  }
  public var relativeDepartureTime: String? {
    return departureTimeEstimated?.toDate()?.toRelative() ?? departureTimePlanned?.toDate()?.toRelative()
  }
  public var relativeArrivalTime: String? {
    return arrivalTimeEstimated?.toDate()?.toRelative() ?? arrivalTimePlanned?.toDate()?.toRelative()
  }
  public var departureTimeInPast: Bool? {
    return departureTimeEstimated?.toDate()?.isInPast ?? departureTimePlanned?.toDate()?.isInPast
  }
}
