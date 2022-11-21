import Foundation

public struct TripRequestResponse: Decodable {
  /// The version of the API that provided the response. Note that if this value is different to above, then the returned data may be different than expected. You can set the expected version using the `version` request parameter.
  public var version: String?
  
  /// Contains zero or more journeys found based on the input parameters.
  public var journeys: [TripRequestResponseJourney]?
}
