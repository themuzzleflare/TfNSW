import Foundation
import CoreLocation
import SwiftDate

public struct TripRequestResponseJourneyLegStop: Decodable {
  public var isGlobalId: Bool?
  
  /// This is a unique ID for the returned location. Certain types of ID can be used for subsequent searches performed with `stop_finder`, or can be used as the origin or destination in an `trip` request. The format of a location ID differs greatly, depending on the type of location it is.
  public var id: String?
  
  /// This is the long version of the location name, which may include the suburb or other information.
  @StopName public var name: String?
  
  /// This is the short version of the location name, which does not include the suburb or other information.
  @StopName public var disassembledName: String?
  
  /// This is the type of location being returned. It will typically represent a specific stop or platform. = ['poi', 'singlehouse', 'stop', 'platform', 'street', 'locality', 'suburb', 'unknown'].
  public var type: LocationType?
  
  /// Contains exactly two values: the first value is the latitude, the second value is the longitude.
  public var coord: [CLLocationDegrees]?
  
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
  
  public var isCancelled: Bool?
  
  public enum CodingKeys: String, CodingKey {
    case isGlobalId, id, name, disassembledName, type, coord, niveau, parent, productClasses, departureTimePlanned, departureTimeEstimated, arrivalTimePlanned, arrivalTimeEstimated, properties, isCancelled
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    isGlobalId = try values.decodeIfPresent(Bool.self, forKey: .isGlobalId)
    id = try values.decodeIfPresent(String.self, forKey: .id)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    disassembledName = try values.decodeIfPresent(String.self, forKey: .disassembledName)
    type = try values.decodeIfPresent(LocationType.self, forKey: .type)
    coord = try values.decodeIfPresent([CLLocationDegrees].self, forKey: .coord)
    niveau = try values.decodeIfPresent(Int.self, forKey: .niveau)
    parent = try values.decodeIfPresent(ParentLocation.self, forKey: .parent)
    productClasses = try values.decodeIfPresent([ProductClass].self, forKey: .productClasses)
    departureTimePlanned = try values.decodeIfPresent(String.self, forKey: .departureTimePlanned)
    departureTimeEstimated = try values.decodeIfPresent(String.self, forKey: .departureTimeEstimated)
    arrivalTimePlanned = try values.decodeIfPresent(String.self, forKey: .arrivalTimePlanned)
    arrivalTimeEstimated = try values.decodeIfPresent(String.self, forKey: .arrivalTimeEstimated)
    properties = try values.decodeIfPresent(LegStopProperties.self, forKey: .properties)
    isCancelled = try values.decodeIfPresent(Bool.self, forKey: .isCancelled)
  }
}

extension TripRequestResponseJourneyLegStop {
  /// If available, `disassembledName`. Otherwise, `name`.
  public var stopName: String? {
    return disassembledName ?? name
  }
  
  /// The `stopName` of the stop, with occurences of "Station" removed.
  public var shortNamePlatform: String? {
    return stopName?.replacingOccurrences(of: " Station", with: "")
  }
  
  /// The `stopName` of the stop, with occurences of "Station" and "Platform" removed.
  public var shortName: String? {
    guard let shortNamePlatform else { return nil }
    if shortNamePlatform.localizedStandardContains(", Platform") {
      return shortNamePlatform.split(separator: ",").dropLast().joined()
    } else {
      return shortNamePlatform
    }
  }
  
  public var platformName: String? {
    guard let disassembledName, disassembledName.localizedStandardContains(", Platform") else { return nil }
    return disassembledName.split(separator: ", ").dropFirst(1).joined()
  }
  
  /// If available, `departureTimeEstimated`. Otherwise, `departureTimePlanned`.
  public var departureTime: String? {
    return departureTimeEstimated ?? departureTimePlanned
  }
  
  /// If available, `arrivalTimeEstimated`. Otherwise, `arrivalTimePlanned`.
  public var arrivalTime: String? {
    return arrivalTimeEstimated ?? arrivalTimePlanned
  }
  
  public var departureTimeEstimatedDate: DateInRegion? {
    return departureTimeEstimated?.toDate(region: .current)
  }
  
  public var arrivalTimeEstimatedDate: DateInRegion? {
    return arrivalTimeEstimated?.toDate(region: .current)
  }
  
  public var departureTimePlannedDate: DateInRegion? {
    return departureTimePlanned?.toDate(region: .current)
  }
  
  public var arrivalTimePlannedDate: DateInRegion? {
    return arrivalTimePlanned?.toDate(region: .current)
  }
  
  public var departureTimeDate: DateInRegion? {
    return departureTime?.toDate(region: .current)
  }
  
  public var arrivalTimeDate: DateInRegion? {
    return arrivalTime?.toDate(region: .current)
  }
  
  public var departureTimeEstimatedText: String? {
    return departureTimeEstimatedDate?.toString(.time(.short))
  }
  
  public var departureTimePlannedText: String? {
    return departureTimePlannedDate?.toString(.time(.short))
  }
  
  public var arrivalTimeEstimatedText: String? {
    return arrivalTimeEstimatedDate?.toString(.time(.short))
  }
  
  public var arrivalTimePlannedText: String? {
    return arrivalTimePlannedDate?.toString(.time(.short))
  }
  
  public var departureTimeText: String? {
    return departureTimeDate?.toString(.time(.short))
  }
  
  public var arrivalTimeText: String? {
    return arrivalTimeDate?.toString(.time(.short))
  }
  
  public var relativeDepartureTime: String? {
    return departureTimeDate?.toRelative(since: .init())
  }
  
  public var relativeArrivalTime: String? {
    return arrivalTimeDate?.toRelative(since: .init())
  }
  
  public var departureTimeInPast: Bool? {
    return departureTimeDate?.isInPast
  }
  
  public var arrivalTimeDelay: Int? {
    guard let arrivalTimePlannedDate,
          let interval = arrivalTimeEstimatedDate?.timeIntervalSince(arrivalTimePlannedDate) else { return nil }
    return Int(interval)
  }
  
  public var departureTimeDelay: Int? {
    guard let departureTimePlannedDate,
          let interval = departureTimeEstimatedDate?.timeIntervalSince(departureTimePlannedDate) else { return nil }
    return Int(interval)
  }
  
  public var arrivalTimeDelayText: String? {
    guard let arrivalTimeDelay, arrivalTimeDelay >= 60 || arrivalTimeDelay <= -60 else { return nil }
    var arrTimeDelay = arrivalTimeDelay
    
    if arrivalTimeDelay.signum() == -1 {
      arrTimeDelay.negate()
    }
    
    let text = arrTimeDelay.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = .minute
    }
    
    return "\(text) \(arrivalTimeDelay.signum() == -1 ? "early" : "late")"
  }
  
  public var departureTimeDelayText: String? {
    guard let departureTimeDelay, departureTimeDelay >= 60 || departureTimeDelay <= -60 else { return nil }
    var depTimeDelay = departureTimeDelay
    
    if departureTimeDelay.signum() == -1 {
      depTimeDelay.negate()
    }
    
    let text = depTimeDelay.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = .minute
    }
    
    return "\(text) \(departureTimeDelay.signum() == -1 ? "early" : "late")"
  }
  
  /// The `CLLocation` of the stop, based on the latitude and longitude values in `coord`.
  public var location: CLLocation? {
    if let coord {
      return CLLocation(latitude: coord[0], longitude: coord[1])
    } else {
      return nil
    }
  }
}
