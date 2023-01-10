import Foundation
import UIKit

public struct TripRequestResponseJourney: Decodable {
  public let rating: Int?
  
  public let isAdditional: Bool?
  
  /// The number of interchanges involved in the journey.
  public let interchanges: Int?
  
  /// This element contains one or more legs that constitute the trip.
  public let legs: [TripRequestResponseJourneyLeg]?
  
  public let daysOfService: TripRequestResponseJourneyDaysOfService?
}

public extension TripRequestResponseJourney {
  /// The approximate amount of time in seconds required to complete this journey.
  var totalDuration: Int {
    return legs?.totalDuration ?? 0
  }
  
  var totalDurationText: String {
    return legs?.totalDurationText ?? ""
  }
  
  var fromName: String? {
    return legs?.fromName
  }
  
  var toName: String? {
    return legs?.toName
  }
  
  var fromTime: String? {
    return legs?.fromTime
  }
  
  var toTime: String? {
    return legs?.toTime
  }
  
  var relativeDepartureTime: String? {
    return legs?.relativeDepartureTime
  }
  
  /// Whether or not the departure date and time of the first leg's origin is in the past.
  var departueTimeInPast: Bool? {
    return legs?.departueTimeInPast
  }
  
  var transportationNames: String? {
    return legs?.transportationNames
  }
  
  /// The `ProductClass` of the first leg's transportation.
  var initialProductClass: ProductClass? {
    return legs?.initialProductClass
  }
  
  /// The `IconID` of the first leg's transportation.
  var initialIconId: IconID? {
    return legs?.initialIconId
  }
  
  var productColour: UIColor? {
    return legs?.productColour
  }
}
