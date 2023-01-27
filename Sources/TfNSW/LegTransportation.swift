import Foundation

public typealias LegTransportation = TripJourney.Leg.Transportation

public extension TripJourney.Leg {
  struct Transportation: Decodable {
    /// This is an ID that uniquely identifies this route.
    public let id: String?
    
    /// This contains the full name of the route.
    public let name: String?
    
    /// Contains a very short name for the route.
    public let disassembledName: String?
    
    /// Contains a short name for the route.
    public let number: String?
    
    /// Contains a description of this route.
    public let description: String?
    
    /// This element contains additional properties about the route.
    public let product: RouteProduct?
    
    /// This element describes the operator of this route.
    public let `operator`: RouteOperator?
    
    /// This element contains information about where vehicles on this route terminate.
    public let destination: RouteDestination?
    
    /// Contains additional properties about this route.
    public let properties: RouteProperties?
    
    public let routeColour: String?
  }
}

public extension TripJourney.Leg.Transportation {
  var tripId: String? {
    return properties?.realtimeTripId ?? properties?.avmsTripId
  }
  
  var completeAgencyId: String? {
    return `operator`?.id
  }
  
  var completeAgencyName: String? {
    return `operator`?.name
  }
  
  var routeShortName: String? {
    return disassembledName
  }
  
  var routeLongName: String? {
    return number
  }
  
  var firstBlockRouteDirection: String? {
    return description
  }
  
  var routeDesc: String? {
    return product?.name
  }
  
  var lastBlockHeadsign: String? {
    return destination?.name
  }
}
