import Foundation

@propertyWrapper public struct StopName: Decodable {
  private var string: String?
  
  public var wrappedValue: String? {
    get { return string }
    set {
      string = newValue?
        .replacingOccurrences(of: "Macquarie University", with: "Macquarie Uni")
        .replacingOccurrences(of: "Mount Kuring-gai", with: "Mt. Kuring-Gai")
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
