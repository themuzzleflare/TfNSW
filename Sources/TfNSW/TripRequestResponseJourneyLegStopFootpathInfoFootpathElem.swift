import Foundation

public struct TripRequestResponseJourneyLegStopFootpathInfoFootpathElem: Decodable {
  /// Contains additional information about this instruction, but is generally unused.
  public let description: String?
  
  /// This indicates the type of "terrain" for this instruction. `LEVEL` indicates a normal flat surface.
  public let type: FootpathElemType?
  
  /// Indicates the floor number the instruction is starting from. If the `type` is `LEVEL`, then the `levelFrom` and `levelTo` values should be the same.
  public let levelFrom: Int?
  
  /// Indicates the floor number the instruction ends of. If the `type` is `LEVEL`, then the `levelFrom` and `levelTo` values should be the same.
  public let levelTo: Int?
  
  /// Indicates the direction of travel for this instruction. Generally a ramp, escalator or stairs will go `UP` or `DOWN` to a different floor. This value will be `LEVEL` when the `type` field is also `LEVEL`.
  public let level: FootpathElemLevelType?
  
  /// Indicates the starting location for this leg, in terms of locations in the system such as stops or places of interest. Typically, since these instructions indicate how to travel within a stop or station, the `origin` and `destination` will both reference the same stop, but the coordinate will be specific to this instruction.
  public let origin: TripRequestResponseJourneyLegStopFootpathInfoFootpathElemLocation?
  
  /// Indicates the starting location for this leg, in terms of locations in the system such as stops or places of interest. Typically, since these instructions indicate how to travel within a stop or station, the `origin` and `destination` will both reference the same stop, but the coordinate will be specific to this instruction.
  public let destination: TripRequestResponseJourneyLegStopFootpathInfoFootpathElemLocation?
}
