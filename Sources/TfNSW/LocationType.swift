import Foundation

public enum LocationType: String, Decodable {
  case pointOfInterest = "poi"
  case singlehouse
  case stop
  case platform
  case street
  case locality
  case suburb
  case unknown
}
