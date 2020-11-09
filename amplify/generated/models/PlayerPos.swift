// swiftlint:disable all
import Amplify
import Foundation

public struct PlayerPos: Model {
  public let id: String
  public var x: Int
  public var y: Int
  public var frame: Int
  
  public init(id: String = UUID().uuidString,
      x: Int,
      y: Int,
      frame: Int) {
      self.id = id
      self.x = x
      self.y = y
      self.frame = frame
  }
}