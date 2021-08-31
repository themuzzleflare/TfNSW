import Foundation
import UIKit

public struct TripRequestResponseJourney: Decodable {
  public var rating: Int?

  public var isAdditional: Bool?

  /// The number of interchanges involved in the journey.
  public var interchanges: Int?

  /// This element contains one or more legs that constitute the trip.
  public var legs: [TripRequestResponseJourneyLeg]?
}

extension TripRequestResponseJourney {
  /// The approximate amount of time in seconds required to complete this journey.
  public var totalDuration: Int {
    var duration: Int = 0
    legs?.forEach { duration += $0.duration ?? 0 }
    return duration
  }

  /// The value of the `totalDurationTextNode` displayed on a `JourneyCellNode`.
  public var totalDurationText: String {
    return totalDuration.secondsToHoursMinutesSeconds
  }

  /// The value of the `fromNameTextNode` displayed on a `JourneyCellNode`.
  public var fromName: String? {
    return legs?.first?.origin?.shortNamePlatform
  }

  /// The value of the `toNameTextNode` displayed on a `JourneyCellNode`.
  public var toName: String? {
    return legs?.last?.destination?.shortName
  }

  /// The value of the `fromTimeTextNode` displayed on a `JourneyCellNode`.
  public var fromTime: String? {
    return legs?.first?.origin?.departureTimeText
  }

  /// The value of the `toTimeTextNode` displayed on a `JourneyCellNode`.
  public var toTime: String? {
    return legs?.last?.destination?.arrivalTimeText
  }

  /// The value of the `relativeTimeTextNode` displayed on a `JourneyCellNode`.
  public var relativeDepartureTime: String? {
    return legs?.first?.relativeDepartureTime
  }

  /// Whether or not the departure date and time of the first leg's origin is in the past.
  public var departueTimeInPast: Bool? {
    return legs?.first?.origin?.departureTimeInPast
  }

  /// The value of the `transportationNamesTextNode` displayed on a `JourneyCellNode`.
  public var transportationNames: String? {
    return legs?.compactMap { $0.transportationName }.joined(separator: ",")
  }

  /// The `ProductClass` of the first leg's transportation.
  public var initialProductClass: ProductClass? {
    return legs?.first?.productClass
  }

  /// The background colour of the `relativeTimeDisplayNode` displayed on a `JourneyCellNode`.
  public var colour: UIColor? {
    return departueTimeInPast ?? false ? initialProductClass?.colour.withAlphaComponent(0.500) : initialProductClass?.colour
  }
}
