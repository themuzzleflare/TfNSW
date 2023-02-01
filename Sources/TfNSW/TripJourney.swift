import Foundation

public struct TripJourney: Decodable {
  public let rating: Int?
  
  public let isAdditional: Bool?
  
  /// The number of interchanges involved in the journey.
  public let interchanges: Int?
  
  /// This element contains one or more legs that constitute the trip.
  public let legs: [Leg]
  
  public let daysOfService: DaysOfService?
}

public extension TripJourney {
  /// The approximate amount of time in seconds required to complete this journey.
  var totalDuration: Int {
    return legs.totalDuration
  }
  
  var totalDurationText: String {
    return legs.totalDurationText
  }
  
  var fromName: String? {
    return legs.fromName
  }
  
  var toName: String? {
    return legs.toName
  }
  
  var fromTime: String? {
    return legs.fromTime
  }
  
  var toTime: String? {
    return legs.toTime
  }
  
  var relativeDepTime: String? {
    return legs.relativeDepTime
  }
  
  /// Whether or not the departure date and time of the first leg's origin is in the past.
  var depTimeInPast: Bool? {
    return legs.depTimeInPast
  }
  
  var transportationNames: String? {
    return legs.transportationNames
  }
  
  var firstDivaTransportId: DIVATransportID? {
    return legs.firstDivaTransportId
  }
  
  var firstProductClass: ProductClass? {
    return legs.firstProductClass
  }
  
  var firstIconId: IconID? {
    return legs.firstIconId
  }
}
