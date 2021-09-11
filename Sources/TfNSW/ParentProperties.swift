import Foundation

public struct ParentProperties: Decodable {
  public var stopId: String?
}

#if os(macOS)

import Vapor

extension ParentProperties: Content {}

#endif
