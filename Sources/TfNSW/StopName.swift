import Foundation

@propertyWrapper
public struct StopName {
  public var wrappedValue: String? {
    didSet {
      wrappedValue = wrappedValue?
        .replacing("Macquarie University", with: "Macquarie Uni")
        .replacing("Mount Kuring-gai", with: "Mt. Kuring-Gai")
    }
  }
  
  public init(wrappedValue: String? = nil) {
    self.wrappedValue = wrappedValue?
      .replacing("Macquarie University", with: "Macquarie Uni")
      .replacing("Mount Kuring-gai", with: "Mt. Kuring-Gai")
  }
}
