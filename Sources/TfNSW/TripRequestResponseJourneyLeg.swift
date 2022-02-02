import Foundation
import CoreLocation
import UIKit
import SwiftDate

public struct TripRequestResponseJourneyLeg: Decodable {
  /// The approximate amount of time in seconds required to complete this journey leg.
  public var duration: Int?

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

  /// Contains a number of service alert messages relating to this journey leg. Information returned here is also available using the `add_info` API endpoint.
  public var infos: [TripRequestResponseJourneyLegStopInfo]?

  /// This elements contains a list of coordinates that this journey leg follows. A line between can be plotted between these coordinates in order when representing the journey on a map in order to show where the vehicle travels (or for a walking leg, the path to be walked).
  public var coords: [[CLLocationDegrees]]?

  /// Contains information for how to interchange between the end of one leg to the next journey leg.
  public var interchange: TripRequestResponseJourneyLegInterchange?

  /// Contains additional information about this journey leg, such as wheelchair accessibility information.
  public var properties: JourneyLegProperties?
}

extension TripRequestResponseJourneyLeg {
  /// The value of the `durationTextNode` displayed on a `LegCellNode`.
  public var durationText: String {
    return duration?.intervalString ?? ""
  }

  /// Whether or not both the vehicle and the stop are wheelchair-accessible.
  public var isWheelchairAccessible: Bool? {
    return properties?.PlanLowFloorVehicle == .oneValue && properties?.PlanWheelChairAccess == .oneValue ? true : false
  }

  /// The value of the `fromNameTextNode` displayed on a `LegCellNode`.
  public var fromName: String? {
    return origin?.shortNamePlatform
  }

  /// The value of the `toNameTextNode` displayed on a `LegCellNode`.
  public var toName: String? {
    return destination?.shortNamePlatform
  }

  /// The value of the `fromTimeTextNode` displayed on a `LegCellNode`.
  public var fromTime: String? {
    return origin?.departureTimeText
  }

  /// The value of the `toTimeTextNode` displayed on a `LegCellNode`.
  public var toTime: String? {
    return destination?.arrivalTimeText
  }

  /// The relative departure time of the leg's origin.
  public var relativeDepartureTime: String? {
    return origin?.relativeDepartureTime
  }

  /// The relative wait time between the arrival of the previous leg and the departure of the current leg.
  public func relativeWaitTime(for leg: TripRequestResponseJourneyLeg) -> String? {
    let previousLegArrivalTime = leg.destination?.arrivalTime?.toDate(region: .current)
    let currentLegDepartureTime = origin?.departureTime?.toDate(region: .current)
    let difference = currentLegDepartureTime?.difference(in: .second, from: previousLegArrivalTime!)
    return "\(difference?.intervalString ?? "") wait"
  }

  /// Whether or not the departure date and time of the leg's origin is in the past.
  public var departueTimeInPast: Bool? {
    return origin?.departureTimeInPast
  }

  /// The value of the `transportationNameTextNode` displayed on a `LegCellNode`.
  public var transportationName: String? {
    return transportation?.disassembledName
  }

  /// The `ProductClass` of the leg's transportation.
  public var productClass: ProductClass? {
    return transportation?.product?.class
  }

  /// The background colour of the `relativeTimeDisplayNode` displayed on a `LegCellNode`.
  public var colour: UIColor? {
    return departueTimeInPast ?? false ? productClass?.colour.withAlphaComponent(0.500) : productClass?.colour
  }
}
