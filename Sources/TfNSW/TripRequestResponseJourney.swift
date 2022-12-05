import Foundation
import UIKit

public struct TripRequestResponseJourney: Decodable {
  public var rating: Int?
  
  public var isAdditional: Bool?
  
  /// The number of interchanges involved in the journey.
  public var interchanges: Int?
  
  /// This element contains one or more legs that constitute the trip.
  public var legs: [TripRequestResponseJourneyLeg]?
  
  public var daysOfService: TripRequestResponseJourneyDaysOfService?
}

extension TripRequestResponseJourney {
  /// The approximate amount of time in seconds required to complete this journey.
  public var totalDuration: Int {
    return legs?.totalDuration ?? 0
  }
  
  /// The value of the `totalDurationTextNode` displayed on a `JourneyCellNode`.
  public var totalDurationText: String {
    return legs?.totalDurationText ?? ""
  }
  
  /// The value of the `fromNameTextNode` displayed on a `JourneyCellNode`.
  public var fromName: String? {
    return legs?.fromName
  }
  
  /// The value of the `toNameTextNode` displayed on a `JourneyCellNode`.
  public var toName: String? {
    return legs?.toName
  }
  
  /// The value of the `fromTimeTextNode` displayed on a `JourneyCellNode`.
  public var fromTime: String? {
    return legs?.fromTime
  }
  
  /// The value of the `toTimeTextNode` displayed on a `JourneyCellNode`.
  public var toTime: String? {
    return legs?.toTime
  }
  
  /// The value of the `relativeTimeTextNode` displayed on a `JourneyCellNode`.
  public var relativeDepartureTime: String? {
    return legs?.relativeDepartureTime
  }
  
  /// Whether or not the departure date and time of the first leg's origin is in the past.
  public var departueTimeInPast: Bool? {
    return legs?.departueTimeInPast
  }
  
  /// The value of the `transportationNamesTextNode` displayed on a `JourneyCellNode`.
  public var transportationNames: String? {
    return legs?.transportationNames
  }
  
  /// The `ProductClass` of the first leg's transportation.
  public var initialProductClass: ProductClass? {
    return legs?.initialProductClass
  }
  
  /// The background colour of the `relativeTimeDisplayNode` displayed on a `JourneyCellNode`.
  public var colour: UIColor? {
    return legs?.colour
  }
}
