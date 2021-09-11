import Foundation

public struct LegStopInfoProperties: Decodable {
  public var appliesTo: String?

  public var stopIDglobalID: String?

  public var speechText: String?
}

#if os(macOS)

import Vapor

extension LegStopInfoProperties: Content {}

#endif
