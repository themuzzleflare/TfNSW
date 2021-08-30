import Foundation

public struct ParentLocation: Decodable {
  public var isGlobalId: Bool?
  public var id: String?
  public var name: String?
  public var disassembledName: String?
  public var type: LocationType?
  public var parent: GrandparentLocation? // In some cases, a parent location will also contain its parent (in other words, the grandparent of the initial location).
  public var properties: ParentProperties?
}
