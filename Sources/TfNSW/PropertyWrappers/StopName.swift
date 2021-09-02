import Foundation

@propertyWrapper public struct StopName: Decodable {
  public var wrappedValue: String? {
    didSet { wrappedValue = wrappedValue?.replacingOccurrences(of: "University", with: "Uni") }
  }

  public init(wrappedValue: String?) {
    self.wrappedValue = wrappedValue
  }
}
