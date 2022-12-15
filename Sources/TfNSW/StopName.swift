import Foundation

@propertyWrapper
public struct StopName: Decodable {
  private var string: String?
  
  public var wrappedValue: String? {
    get { return string }
    set {
      string = newValue?
        .replacing("Macquarie University", with: "Macquarie Uni")
        .replacing("Mount Kuring-gai", with: "Mt. Kuring-Gai")
    }
  }
  
  public init(wrappedValue: String?) {
    self.wrappedValue = wrappedValue
  }
  
  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer()
    let stringValue = try value.decode(String.self)
    self.init(wrappedValue: stringValue)
  }
}
