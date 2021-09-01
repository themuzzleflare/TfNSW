import Foundation
import SwiftDate
import CoreLocation

public struct TripRequestResponseJourneyLegStop: Decodable, Identifiable {
  public var isGlobalId: Bool?

  /// This is a unique ID for the returned location. Certain types of ID can be used for subsequent searches performed with `stop_finder`, or can be used as the origin or destination in an `trip` request. The format of a location ID differs greatly, depending on the type of location it is.
  public var id: String?

  /// This is the long version of the location name, which may include the suburb or other information.
  public var name: String?

  /// This is the short version of the location name, which does not include the suburb or other information.
  public var disassembledName: String?

  /// This is the type of location being returned. It will typically represent a specific stop or platform. = ['poi', 'singlehouse', 'stop', 'platform', 'street', 'locality', 'suburb', 'unknown'].
  public var type: LocationType?

  /// Contains exactly two values: the first value is the latitude, the second value is the longitude.
  public var coord: [Double]?

  public var niveau: Int?

  /// If available, contains information about this location's parent location. For example, if the stop has a type of `platform`, then this field may contain information about the station in which the platform is located.
  public var parent: ParentLocation?

  public var productClasses: [ProductClass]?

  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates the planned departure time. This is the original scheduled time.
  public var departureTimePlanned: String?

  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates the estimated departure time. If real-time information is available then this timestamp is the real-time estimate, otherwise it is the same as the value in `departureTimePlanned`.
  public var departureTimeEstimated: String?

  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates the planned arrival time. This is the original scheduled time.
  public var arrivalTimePlanned: String?

  /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates the estimated arrival time. If real-time information is available then this timestamp is the real-time estimate, otherwise it is the same as the value in `arrivalTimePlanned`.
  public var arrivalTimeEstimated: String?

  /// Contains additional information about this stop, such as wheelchair accessibility information.
  public var properties: LegStopProperties?
}

extension TripRequestResponseJourneyLegStop {
  /// The `disassembledName` of the stop, with occurences of "Station" removed.
  public var shortNamePlatform: String? {
    return disassembledName?.replacingOccurrences(of: " Station", with: "")
  }

  /// The `disassembledName` of the stop, with occurences of "Station" and "Platform" removed.
  public var shortName: String? {
    return disassembledName?.replacingOccurrences(of: " Station", with: "").split(separator: ",").dropLast().joined()
  }

  /// If available, `departureTimeEstimated`. Otherwise, `departureTimePlanned`.
  public var departureTime: String? {
    return departureTimeEstimated ?? departureTimePlanned
  }

  /// If available, `arrivalTimeEstimated`. Otherwise, `arrivalTimePlanned`.
  public var arrivalTime: String? {
    return arrivalTimeEstimated ?? arrivalTimePlanned
  }

  public var departureTimeText: String? {
    return departureTime?.toDate()?.toString(.time(.short))
  }

  public var arrivalTimeText: String? {
    return arrivalTime?.toDate()?.toString(.time(.short))
  }

  public var relativeDepartureTime: String? {
    return departureTime?.toDate()?.toRelative()
  }

  public var relativeArrivalTime: String? {
    return arrivalTime?.toDate()?.toRelative()
  }

  public var departureTimeInPast: Bool? {
    return departureTime?.toDate()?.isInPast
  }

  public var location: CLLocation? {
    return CLLocation(latitude: coord![0], longitude: coord![1])
  }
}
