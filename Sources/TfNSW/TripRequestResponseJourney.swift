import Foundation

public struct TripRequestResponseJourney: Decodable {
  public var rating: Int?

  public var isAdditional: Bool?

  public var interchanges: Int?

  /// This element contains one or more legs that constitute the trip.
  public var legs: [TripRequestResponseJourneyLeg]?
}

extension TripRequestResponseJourney {
  public var totalDuration: Int {
    var duration: Int = 0
    legs?.forEach { duration += $0.duration ?? 0 }
    return duration
  }
  
  public var totalDurationText: String {
    return secondsToHoursMinutesSecondsStr(seconds: totalDuration)
  }
}
