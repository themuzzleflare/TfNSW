import Foundation

@propertyWrapper public struct StopName: Decodable {
  private var string: String?

  public var wrappedValue: String? {
    get { return string }
    set {
      string = newValue?
        .replacingOccurrences(of: "Macquarie University", with: "Macquarie Uni")
        .replacingOccurrences(of: "International Airport", with: "Intnl Airport")
    }
  }

  public init(wrappedValue: String?) {
    self.wrappedValue = wrappedValue
  }

  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer()
    let stringValue = try value.decode(String.self)
    wrappedValue = stringValue
  }
}
