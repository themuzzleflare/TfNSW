import Foundation

@propertyWrapper public struct StopName: Decodable {
  public var wrappedValue: String?

  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer()
    let stringValue = try value.decode(String.self)
    wrappedValue = stringValue.replacingOccurrences(of: "University", with: "Uni")
  }
}
