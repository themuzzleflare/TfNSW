import Foundation
import CoreLocation
import UIKit
import SwiftDate
import Algorithms

public typealias TripJourneyLeg = TripJourney.Leg

public extension TripJourney {
  struct Leg: Decodable {
    /// The approximate amount of time in seconds required to complete this journey leg.
    public let duration: Int?
    
    /// The approximate distance in metres travelled to complete this journey leg.
    public let distance: Int?
    
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
  }
}

public extension TripJourney.Leg {
  var durationText: String {
    let duration = duration ?? 0
    return duration.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.hour, .minute]
    }
  }
  
  /// Whether or not both the vehicle and the stop are wheelchair-accessible.
  var isWheelchairAccessible: Bool? {
    return properties?.isWheelchairAccessible
  }
  
  var realtimeId: String? {
    return transportation?.tripId
  }
  
  var fromName: String? {
    return origin?.shortNamePlatform(productClass: transportation?.product?.class)
  }
  
  var fromNameShort: String? {
    return origin?.shortName(productClass: transportation?.product?.class)
  }
  
  var toName: String? {
    return destination?.shortNamePlatform(productClass: transportation?.product?.class)
  }
  
  var toNameShort: String? {
    return destination?.shortName(productClass: transportation?.product?.class)
  }
  
  var legName: String? {
    guard let from = origin?.shortName(productClass: transportation?.product?.class),
          let to = destination?.shortName(productClass: transportation?.product?.class) else { return nil }
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
  
  /// The relative wait time between the arrival of the previous leg and the departure of the current leg.
  func relativeWaitTime(for leg: TripJourney.Leg) -> Int? {
    guard let previousLegArrivalTime = leg.destination?.arrTimeDate else { return nil }
    return origin?.depTimeDate?.difference(in: .second, from: previousLegArrivalTime)
  }
  
  func relativeWaitTimeText(for leg: TripJourney.Leg) -> String? {
    guard let relativeWaitTime = relativeWaitTime(for: leg) else { return nil }
    let string = relativeWaitTime.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.hour, .minute]
    }
    return "\(string) wait"
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
  var totalDuration: Int {
    return self.compactMap({$0.duration}).reduce(0, +)
  }
  
  var totalDurationText: String {
    return self.totalDuration.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.hour, .minute]
    }
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
