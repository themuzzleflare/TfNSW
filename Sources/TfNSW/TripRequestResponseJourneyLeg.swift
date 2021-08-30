import Foundation

public struct TripRequestResponseJourneyLeg: Decodable {
  public var duration: Int? // The approximate amount of time in seconds required to complete this journey leg.
  public var isRealtimeControlled: Bool? // This indicates whether or not real-time data has been used to calculate the departure/arrival timestamps.
  public var realtimeStatus: [String]?
  public var origin: TripRequestResponseJourneyLegStop? // This is the starting location of the leg.
  public var destination: TripRequestResponseJourneyLegStop? // This is the finishing location of the leg.
  public var transportation: TripTransportation? // This element contains information about the mode of transport and/or route used to complete this journey leg.
  public var stopSequence: [TripRequestResponseJourneyLegStop]? // This is a list of all stops that are made for this leg. It is sorted in order of its stopping sequence. If the leg is a walking leg between two stops, then this will contain these two stops in order.
  public var infos: [TripRequestResponseJourneyLegStopInfo]? // Contains a number of service alert messages relating to this journey leg. Information returned here is also available using the add_info API endpoint.
  public var coords: [[Double]]? // This elements contains a list of coordinates that this journey leg follows. A line between can be plotted between these coordinates in order when representing the journey on a map in order to show where the vehicle travels (or for a walking leg, the path to be walked).
  public var properties: JourneyLegProperties? // Contains additional information about this journey leg, such as wheelchair accessibility information.
}
