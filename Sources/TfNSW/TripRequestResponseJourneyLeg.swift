import Foundation

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
  public var coords: [[Double]]?

  /// Contains additional information about this journey leg, such as wheelchair accessibility information.
  public var properties: JourneyLegProperties?
}

extension TripRequestResponseJourneyLeg {
  public var durationText: String {
    return secondsToHoursMinutesSecondsStr(seconds: duration ?? 0)
  }

  public var isWheelchairAccessible: Bool? {
    return properties?.PlanLowFloorVehicle == .oneValue && properties?.PlanWheelChairAccess == .oneValue ? true : false
  }
}
