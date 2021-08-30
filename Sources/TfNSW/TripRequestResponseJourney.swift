import Foundation
import UIKit

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

  public var fromName: String? {
    return legs?.first?.origin?.shortNamePlatform
  }

  public var toName: String? {
    return legs?.last?.destination?.shortName
  }

  public var fromTime: String? {
    return legs?.first?.origin?.departureTimeText
  }

  public var toTime: String? {
    return legs?.last?.destination?.arrivalTimeText
  }

  public var relativeDepartureTime: String? {
    return legs?.first?.origin?.relativeDepartureTime
  }

  public var departueTimeInPast: Bool? {
    return legs?.first?.origin?.departureTimeInPast
  }

  public var transportationNames: String? {
    return legs?.compactMap { $0.transportationName }.joined(separator: ",")
  }

  public var initialProductClass: ProductClass? {
    return legs?.first?.transportation?.product?.class
  }

  public var colour: UIColor? {
    return departueTimeInPast ?? false ? initialProductClass?.colour.withAlphaComponent(0.500) : initialProductClass?.colour
  }
}
