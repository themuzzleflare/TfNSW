import Foundation
import CoreLocation
import Algorithms

public typealias TripJourneyLeg = TripJourney.Leg

public extension TripJourney {
  struct Leg: Decodable {
    /// The approximate amount of time in seconds required to complete this journey leg.
    public let duration: Duration?
    
    /// The approximate distance in metres travelled to complete this journey leg.
    public let distance: CLLocationDistance?
    
    /// This indicates whether or not real-time data has been used to calculate the departure/arrival timestamps.
    public let isRealtimeControlled: Bool?
    
    public let realtimeStatus: [String]?
    
    /// This is the starting location of the leg.
    public let origin: Stop?
    
    /// This is the finishing location of the leg.
    public let destination: Stop?
    
    /// This element contains information about the mode of transport and/or route used to complete this journey leg.
    public let transportation: Transportation?
    
    /// Contains a number of additional informational messages that may be useful for travellers.
    public let hints: [Hint]?
    
    /// This is a list of all stops that are made for this leg. It is sorted in order of its stopping sequence. If the leg is a walking leg between two stops, then this will contain these two stops in order.
    public let stopSequence: [Stop]
    
    /// If the leg corresponds to a walking leg, this element contains walking directions.
    public let footPathInfo: [FootpathInfo]?
    
    /// Contains a number of service alert messages relating to this journey leg. Information returned here is also available using the `add_info` API endpoint.
    public let infos: [Info]?
    
    /// This elements contains a list of coordinates that this journey leg follows. A line between can be plotted between these coordinates in order when representing the journey on a map in order to show where the vehicle travels (or for a walking leg, the path to be walked).
    public let coords: [[CLLocationDegrees]]?
    
    /// Contains walking information for completing this journey leg.
    public let pathDescriptions: [PathDescription]?
    
    /// Contains information for how to interchange between the end of one leg to the next journey leg.
    public let interchange: Interchange?
    
    /// Contains additional information about this journey leg, such as wheelchair accessibility information.
    public let properties: Properties?
    
    enum CodingKeys: CodingKey {
      case duration, distance, isRealtimeControlled, realtimeStatus, origin, destination, transportation, hints, stopSequence, footPathInfo, infos, coords, pathDescriptions, interchange, properties
    }
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      
      self.duration = try {
        guard let int = try container.decodeIfPresent(Int.self, forKey: .duration) else { return nil }
        return Duration.seconds(int)
      }()
      
      self.distance = try container.decodeIfPresent(CLLocationDistance.self, forKey: .distance)
      self.isRealtimeControlled = try container.decodeIfPresent(Bool.self, forKey: .isRealtimeControlled)
      self.realtimeStatus = try container.decodeIfPresent([String].self, forKey: .realtimeStatus)
      self.origin = try container.decodeIfPresent(Stop.self, forKey: .origin)
      self.destination = try container.decodeIfPresent(Stop.self, forKey: .destination)
      self.transportation = try container.decodeIfPresent(Transportation.self, forKey: .transportation)
      self.hints = try container.decodeIfPresent([Hint].self, forKey: .hints)
      self.stopSequence = try container.decode([Stop].self, forKey: .stopSequence)
      self.footPathInfo = try container.decodeIfPresent([FootpathInfo].self, forKey: .footPathInfo)
      self.infos = try container.decodeIfPresent([Info].self, forKey: .infos)
      self.coords = try container.decodeIfPresent([[CLLocationDegrees]].self, forKey: .coords)
      self.pathDescriptions = try container.decodeIfPresent([PathDescription].self, forKey: .pathDescriptions)
      self.interchange = try container.decodeIfPresent(Interchange.self, forKey: .interchange)
      self.properties = try container.decodeIfPresent(Properties.self, forKey: .properties)
    }
  }
}

public extension TripJourney.Leg {
  var durationText: String {
    let duration = duration ?? .seconds(0)
    return duration.formatted(.legDuration)
  }
  
  /// Whether or not both the vehicle and the stop are wheelchair-accessible.
  var isWheelchairAccessible: Bool? {
    return properties?.isWheelchairAccessible
  }
  
  var realtimeId: String? {
    return transportation?.tripId
  }
  
  var fromName: String? {
    return origin?.shortNamePlatform(productClass: productClass)
  }
  
  var fromNameShort: String? {
    return origin?.shortName(productClass: productClass)
  }
  
  var toName: String? {
    return destination?.shortNamePlatform(productClass: productClass)
  }
  
  var toNameShort: String? {
    return destination?.shortName(productClass: productClass)
  }
  
  var legName: String? {
    guard let from = origin?.shortName(productClass: productClass),
          let to = destination?.shortName(productClass: productClass) else { return nil }
    return "\(from) to \(to)"
  }
  
  var fromTime: String? {
    return origin?.depTimeText
  }
  
  var toTime: String? {
    return destination?.arrTimeText
  }
  
  /// The relative departure time of the leg's origin.
  var relativeDepTime: String? {
    return origin?.relativeDepTime
  }
  
  var relativeDepTimeAttr: AttributedString? {
    return origin?.relativeDepTimeAttr
  }
  
  /// The relative wait time between the arrival of the previous leg and the departure of the current leg.
  func relativeWaitTime(for leg: TripJourney.Leg) -> Duration? {
    guard let previousLegArrivalTime = leg.destination?.arrTimeDate,
          let originDepTimeDate = origin?.depTimeDate else { return nil }
    return .seconds(previousLegArrivalTime.distance(to: originDepTimeDate))
  }
  
  func relativeWaitTimeText(for leg: TripJourney.Leg) -> String? {
    guard let relativeWaitTime = relativeWaitTime(for: leg) else { return nil }
    let string = relativeWaitTime.formatted(.relativeWaitTime)
    return "\(string) wait"
  }
  
  func relativeWaitTimeTextAttr(for leg: TripJourney.Leg) -> AttributedString? {
    guard let relativeWaitTimeText = relativeWaitTimeText(for: leg) else { return nil }
    
    var attr = AttributedString(relativeWaitTimeText)
    
    attr.font = .preferredFont(forTextStyle: .caption1)
    attr.foregroundColor = .white
    attr.paragraphStyle = .centreAligned
    
    if let digitRange = attr.range(of: #"\d+"#, options: .regularExpression) {
      attr[digitRange].font = .preferredFont(forTextStyle: .body)
    }
    
    return attr
  }
  
  /// Whether or not the departure date and time of the leg's origin is in the past.
  var depTimeInPast: Bool? {
    return origin?.depTimeInPast
  }
  
  var transportationName: String? {
    return transportation?.disassembledName ?? transportation?.product?.name
  }
  
  var divaTransportId: DIVATransportID? {
    return transportation?.product?.id
  }
  
  var productClass: ProductClass? {
    return transportation?.product?.class
  }
  
  var iconId: IconID? {
    return transportation?.product?.iconId
  }
}

public extension Array where Element == TripJourney.Leg {
  /// The approximate amount of time in seconds required to complete this journey.
  var totalDuration: Duration {
    return self.compactMap({$0.duration}).reduce(.seconds(0), +)
  }
  
  var totalDurationText: String {
    return totalDuration.formatted(.legDuration)
  }
  
  var fromName: String? {
    return self.first?.fromName
  }
  
  var toName: String? {
    return self.last?.toNameShort
  }
  
  var tripName: String? {
    guard let from = self.first?.fromNameShort,
          let to = self.last?.toNameShort else { return nil }
    return "\(from) to \(to)"
  }
  
  var fromTime: String? {
    return self.first?.origin?.depTimeText
  }
  
  var toTime: String? {
    return self.last?.destination?.arrTimeText
  }
  
  var relativeDepTime: String? {
    return self.first?.relativeDepTime
  }
  
  var relativeDepTimeAttr: AttributedString? {
    return self.first?.relativeDepTimeAttr
  }
  
  /// Whether or not the departure date and time of the first leg's origin is in the past.
  var depTimeInPast: Bool? {
    return self.first?.origin?.depTimeInPast
  }
  
  var transportationNames: String? {
    return self
      .compactMap({$0.transportationName})
      .uniqued()
      .joined(separator: ",")
  }
  
  var firstDivaTransportId: DIVATransportID? {
    return self.first?.divaTransportId
  }
  
  var firstProductClass: ProductClass? {
    return self.first?.productClass
  }
  
  var firstIconId: IconID? {
    return self.first?.iconId
  }
}
