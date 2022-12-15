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
  
  public var totalDurationText: String {
    return legs?.totalDurationText ?? ""
  }
  
  public var fromName: String? {
    return legs?.fromName
  }
  
  public var toName: String? {
    return legs?.toName
  }
  
  public var fromTime: String? {
    return legs?.fromTime
  }
  
  public var toTime: String? {
    return legs?.toTime
  }
  
  public var relativeDepartureTime: String? {
    return legs?.relativeDepartureTime
  }
  
  /// Whether or not the departure date and time of the first leg's origin is in the past.
  public var departueTimeInPast: Bool? {
    return legs?.departueTimeInPast
  }
  
  public var transportationNames: String? {
    return legs?.transportationNames
  }
  
  /// The `ProductClass` of the first leg's transportation.
  public var initialProductClass: ProductClass? {
    return legs?.initialProductClass
  }
  
  /// The `IconID` of the first leg's transportation.
  public var initialIconId: IconID? {
    return legs?.initialIconId
  }
  
  public var productColour: UIColor? {
    return legs?.productColour
  }
}
