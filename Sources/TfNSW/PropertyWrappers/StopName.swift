import Foundation

@propertyWrapper public struct StopName: Decodable {
  public var wrappedValue: String?

  public init(wrappedValue: String?) {
    self.wrappedValue = wrappedValue?
      .replacingOccurrences(of: "Macquarie University", with: "Macquarie Uni")
      .replacingOccurrences(of: "International Airport", with: "Intnl Airport")
  }

  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer()
    let stringValue = try value.decode(String.self)
    wrappedValue = stringValue
      .replacingOccurrences(of: "Macquarie University", with: "Macquarie Uni")
      .replacingOccurrences(of: "International Airport", with: "Intnl Airport")
  }
}
