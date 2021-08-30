import Foundation

public struct TripRequestResponseJourney: Decodable {
  public var rating: Int?
  public var isAdditional: Bool?
  public var interchanges: Int?
  public var legs: [TripRequestResponseJourneyLeg]? // This element contains one or more legs that constitute the trip.
}
