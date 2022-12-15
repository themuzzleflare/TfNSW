import Foundation
import CoreLocation
import UIKit
import SwiftDate

public struct TripRequestResponseJourneyLeg: Decodable {
  /// The approximate amount of time in seconds required to complete this journey leg.
  public var duration: Int?
  
  /// The approximate distance in metres travelled to complete this journey leg.
  public var distance: Int?
  
  /// This indicates whether or not real-time data has been used to calculate the departure/arrival timestamps.
  public var isRealtimeControlled: Bool?
  
  public var realtimeStatus: [String]?
  
  /// This is the starting location of the leg.
  public var origin: TripRequestResponseJourneyLegStop?
  
  /// This is the finishing location of the leg.
  public var destination: TripRequestResponseJourneyLegStop?
  
  /// This element contains information about the mode of transport and/or route used to complete this journey leg.
  public var transportation: TripTransportation?
  
  /// This is a list of all stops that are made for this leg. It is sorted in order of its stopping sequence. If the leg is a walking leg between two stops, then this will contain these two stops in order.
  public var stopSequence: [TripRequestResponseJourneyLegStop]?
  
  /// If the leg corresponds to a walking leg, this element contains walking directions.
  public var footPathInfo: [TripRequestResponseJourneyLegStopFootpathInfo]?
  
  /// Contains a number of service alert messages relating to this journey leg. Information returned here is also available using the `add_info` API endpoint.
  public var infos: [TripRequestResponseJourneyLegStopInfo]?
  
  /// This elements contains a list of coordinates that this journey leg follows. A line between can be plotted between these coordinates in order when representing the journey on a map in order to show where the vehicle travels (or for a walking leg, the path to be walked).
  public var coords: [[CLLocationDegrees]]?
  
  /// Contains walking information for completing this journey leg.
  public var pathDescriptions: [TripRequestResponseJourneyLegPathDescription]?
  
  /// Contains information for how to interchange between the end of one leg to the next journey leg.
  public var interchange: TripRequestResponseJourneyLegInterchange?
  
  /// Contains additional information about this journey leg, such as wheelchair accessibility information.
  public var properties: JourneyLegProperties?
}

extension TripRequestResponseJourneyLeg {
  public var durationText: String {
    let duration = duration ?? 0
    return duration.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.hour, .minute]
    }
  }
  
  /// Whether or not both the vehicle and the stop are wheelchair-accessible.
  public var isWheelchairAccessible: Bool? {
    return properties?.PlanLowFloorVehicle == .oneValue && properties?.PlanWheelChairAccess == .oneValue ? true : false
  }
  
  public var fromName: String? {
    return origin?.shortNamePlatform
  }
  
  public var toName: String? {
    return destination?.shortNamePlatform
  }
  
  public var legName: String? {
    guard let from = origin?.shortName,
          let to = destination?.shortName else { return nil }
    return "\(from) to \(to)"
  }
  
  public var fromTime: String? {
    return origin?.departureTimeText
  }
  
  public var toTime: String? {
    return destination?.arrivalTimeText
  }
  
  /// The relative departure time of the leg's origin.
  public var relativeDepartureTime: String? {
    return origin?.relativeDepartureTime
  }
  
  /// The relative wait time between the arrival of the previous leg and the departure of the current leg.
  public func relativeWaitTime(for leg: TripRequestResponseJourneyLeg) -> Int? {
    guard let previousLegArrivalTime = leg.destination?.arrivalTimeDate else { return nil }
    return origin?.departureTimeDate?.difference(in: .second, from: previousLegArrivalTime)
  }
  
  public func relativeWaitTimeText(for leg: TripRequestResponseJourneyLeg) -> String? {
    guard let relativeWaitTime = relativeWaitTime(for: leg) else { return nil }
    let string = relativeWaitTime.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.hour, .minute]
    }
    return "\(string) wait"
  }
  
  /// Whether or not the departure date and time of the leg's origin is in the past.
  public var departueTimeInPast: Bool? {
    return origin?.departureTimeInPast
  }
  
  public var transportationName: String? {
    return transportation?.disassembledName ?? transportation?.product?.class?.description
  }
  
  /// The `ProductClass` of the leg's transportation.
  public var productClass: ProductClass? {
    return transportation?.product?.class
  }
  
  /// The `IconID` of the leg's transportation.
  public var iconId: IconID? {
    return transportation?.product?.iconId
  }
  
  public var productColour: UIColor? {
    return departueTimeInPast ?? false ? productClass?.colour.withAlphaComponent(0.5) : productClass?.colour
  }
}

extension Array where Element == TripRequestResponseJourneyLeg {
  public var totalDuration: Int {
    let durationArray = self.compactMap { $0.duration }
    return durationArray.reduce(0, +)
  }
  
  public var totalDurationText: String {
    return totalDuration.seconds.timeInterval.toIntervalString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.hour, .minute]
    }
  }
  
  public var fromName: String? {
    return first?.origin?.shortNamePlatform
  }
  
  public var toName: String? {
    return last?.destination?.shortName
  }
  
  public var tripName: String? {
    guard let from = first?.origin?.shortName,
          let to = last?.destination?.shortName else { return nil }
    return "\(from) to \(to)"
  }
  
  public var fromTime: String? {
    return first?.origin?.departureTimeText
  }
  
  public var toTime: String? {
    return last?.destination?.arrivalTimeText
  }
  
  public var relativeDepartureTime: String? {
    return first?.relativeDepartureTime
  }
  
  /// Whether or not the departure date and time of the first leg's origin is in the past.
  public var departueTimeInPast: Bool? {
    return first?.origin?.departureTimeInPast
  }
  
  public var transportationNames: String? {
    return compactMap { $0.transportationName }.joined(separator: ",")
  }
  
  /// The `ProductClass` of the first leg's transportation.
  public var initialProductClass: ProductClass? {
    return first?.productClass
  }
  
  /// The `IconID` of the first leg's transportation.
  public var initialIconId: IconID? {
    return first?.iconId
  }
  
  public var productColour: UIColor? {
    return first?.productColour
  }
}
