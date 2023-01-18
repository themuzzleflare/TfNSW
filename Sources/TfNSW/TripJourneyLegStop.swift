import Foundation
import CoreLocation
import SwiftDate

public extension TripJourney.Leg {
  struct Stop: Decodable {
    public let isGlobalId: Bool?
    
    /// This is a unique ID for the returned location. Certain types of ID can be used for subsequent searches performed with `stop_finder`, or can be used as the origin or destination in an `trip` request. The format of a location ID differs greatly, depending on the type of location it is.
    public let id: String?
    
    /// This is the long version of the location name, which may include the suburb or other information.
    @StopName public var name: String?
    
    /// This is the short version of the location name, which does not include the suburb or other information.
    @StopName public var disassembledName: String?
    
    /// This is the type of location being returned. It will typically represent a specific stop or platform. = ['poi', 'singlehouse', 'stop', 'platform', 'street', 'locality', 'suburb', 'unknown'].
    public let type: LocationType?
    
    /// Contains exactly two values: the first value is the latitude, the second value is the longitude.
    public let coord: [CLLocationDegrees]?
    
    public let niveau: Int?
    
    /// If available, contains information about this location's parent location. For example, if the stop has a type of `platform`, then this field may contain information about the station in which the platform is located.
    public let parent: ParentLocation?
    
    public let productClasses: [ProductClass]?
    
    /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates the planned departure time. This is the original scheduled time.
    public let departureTimePlanned: String?
    
    /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates the estimated departure time. If real-time information is available then this timestamp is the real-time estimate, otherwise it is the same as the value in `departureTimePlanned`.
    public let departureTimeEstimated: String?
    
    /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates the planned arrival time. This is the original scheduled time.
    public let arrivalTimePlanned: String?
    
    /// A timestamp in `YYYY-MM-DDTHH:MM:SSZ` format that indicates the estimated arrival time. If real-time information is available then this timestamp is the real-time estimate, otherwise it is the same as the value in `arrivalTimePlanned`.
    public let arrivalTimeEstimated: String?
    
    /// Contains additional information about this stop, such as wheelchair accessibility information.
    public let properties: Properties?
    
    public let isCancelled: Bool?
    
    enum CodingKeys: CodingKey {
      case isGlobalId, id, name, disassembledName, type, coord, niveau, parent, productClasses, departureTimePlanned, departureTimeEstimated, arrivalTimePlanned, arrivalTimeEstimated, properties, isCancelled
    }
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.isGlobalId = try container.decodeIfPresent(Bool.self, forKey: .isGlobalId)
      self.id = try container.decodeIfPresent(String.self, forKey: .id)
      self._name.wrappedValue = try container.decodeIfPresent(String.self, forKey: .name)
      self._disassembledName.wrappedValue = try container.decodeIfPresent(String.self, forKey: .disassembledName)
      self.type = try container.decodeIfPresent(LocationType.self, forKey: .type)
      self.coord = try container.decodeIfPresent([CLLocationDegrees].self, forKey: .coord)
      self.niveau = try container.decodeIfPresent(Int.self, forKey: .niveau)
      self.parent = try container.decodeIfPresent(ParentLocation.self, forKey: .parent)
      self.productClasses = try container.decodeIfPresent([ProductClass].self, forKey: .productClasses)
      self.departureTimePlanned = try container.decodeIfPresent(String.self, forKey: .departureTimePlanned)
      self.departureTimeEstimated = try container.decodeIfPresent(String.self, forKey: .departureTimeEstimated)
      self.arrivalTimePlanned = try container.decodeIfPresent(String.self, forKey: .arrivalTimePlanned)
      self.arrivalTimeEstimated = try container.decodeIfPresent(String.self, forKey: .arrivalTimeEstimated)
      self.properties = try container.decodeIfPresent(Properties.self, forKey: .properties)
      self.isCancelled = try container.decodeIfPresent(Bool.self, forKey: .isCancelled)
    }
  }
}

public extension TripJourney.Leg.Stop {
  /// If available, `disassembledName`. Otherwise, `name`.
  var stopName: String? {
    return disassembledName ?? name
  }
  
  var suburb: String? {
    if type == .locality {
      return stopName
    }
    
    guard let parent else { return nil }
    
    if parent.type == .locality {
      return parent.disassembledName ?? parent.name
    }
    
    guard let grandparent = parent.parent, grandparent.type == .locality else { return nil }
    
    return grandparent.name
  }
  
  var stopNameStationRemoved: String? {
    return stopName?.replacing(" Station", with: "")
  }
  
  var stopNamePlatformRemoved: String? {
    return stopName?.replacing(#/(,\s*|\s+)Platform\s*\d+(\s*(?=,))?/#, with: "")
  }
  
  var stopNameStationPlatformRemoved: String? {
    return stopNameStationRemoved?.replacing(#/(,\s*|\s+)Platform\s*\d+(\s*(?=,))?/#, with: "")
  }
  
  func shortNamePlatform(productClass: ProductClass?) -> String? {
    switch productClass {
    case .train, .metro:
      return stopNameStationRemoved
    default:
      return stopName
    }
  }
  
  func shortName(productClass: ProductClass?) -> String? {
    switch productClass {
    case .train, .metro:
      return stopNameStationPlatformRemoved
    default:
      return stopName
    }
  }
  
  /// If available, `departureTimeEstimated`. Otherwise, `departureTimePlanned`.
  var depTime: String? {
    return departureTimeEstimated ?? departureTimePlanned
  }
  
  /// If available, `arrivalTimeEstimated`. Otherwise, `arrivalTimePlanned`.
  var arrTime: String? {
    return arrivalTimeEstimated ?? arrivalTimePlanned
  }
  
  var depTimeEstimatedDate: DateInRegion? {
    return departureTimeEstimated?.toDate(region: .current)
  }
  
  var arrTimeEstimatedDate: DateInRegion? {
    return arrivalTimeEstimated?.toDate(region: .current)
  }
  
  var depTimePlannedDate: DateInRegion? {
    return departureTimePlanned?.toDate(region: .current)
  }
  
  var arrTimePlannedDate: DateInRegion? {
    return arrivalTimePlanned?.toDate(region: .current)
  }
  
  var depTimeDate: DateInRegion? {
    return depTime?.toDate(region: .current)
  }
  
  var arrTimeDate: DateInRegion? {
    return arrTime?.toDate(region: .current)
  }
  
  var depTimeEstimatedText: String? {
    return depTimeEstimatedDate?.toString(.time(.short))
  }
  
  var depTimePlannedText: String? {
    return depTimePlannedDate?.toString(.time(.short))
  }
  
  var arrTimeEstimatedText: String? {
    return arrTimeEstimatedDate?.toString(.time(.short))
  }
  
  var arrTimePlannedText: String? {
    return arrTimePlannedDate?.toString(.time(.short))
  }
  
  var depTimeText: String? {
    return depTimeDate?.toString(.time(.short))
  }
  
  var arrTimeText: String? {
    return arrTimeDate?.toString(.time(.short))
  }
  
  var relativeDepTime: String? {
    return depTimeDate?.toRelative(since: .init())
  }
  
  var relativeArrTime: String? {
    return arrTimeDate?.toRelative(since: .init())
  }
  
  var depTimeInPast: Bool? {
    return depTimeDate?.isInPast
  }
  
  var arrTimeDelay: Int? {
    guard let arrTimePlannedDate,
          let interval = arrTimeEstimatedDate?.timeIntervalSince(arrTimePlannedDate) else { return nil }
    return Int(interval)
  }
  
  var depTimeDelay: Int? {
    guard let depTimePlannedDate,
          let interval = depTimeEstimatedDate?.timeIntervalSince(depTimePlannedDate) else { return nil }
    return Int(interval)
  }
  
  var arrTimeDelayText: String? {
    guard let arrTimeDelay, arrTimeDelay >= 1 || arrTimeDelay <= -1 else { return nil }
    var arrTimeDelayCopy = arrTimeDelay
    
    if arrTimeDelay.signum() == -1 {
      arrTimeDelayCopy.negate()
    }
    
    let text = arrTimeDelayCopy.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.second, .minute, .hour]
    }
    
    return "\(text) \(arrTimeDelay.signum() == -1 ? "early" : "late")"
  }
  
  var depTimeDelayText: String? {
    guard let depTimeDelay, depTimeDelay >= 1 || depTimeDelay <= -1 else { return nil }
    var depTimeDelayCopy = depTimeDelay
    
    if depTimeDelay.signum() == -1 {
      depTimeDelayCopy.negate()
    }
    
    let text = depTimeDelayCopy.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.second, .minute, .hour]
    }
    
    return "\(text) \(depTimeDelay.signum() == -1 ? "early" : "late")"
  }
  
  var location: CLLocation? {
    guard let latitude = coord?.first, let longitude = coord?.last else { return nil }
    return CLLocation(latitude: latitude, longitude: longitude)
  }
}
