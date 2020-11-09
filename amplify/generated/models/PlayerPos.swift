// swiftlint:disable all
import Amplify
import Foundation

public struct PlayerPos: Model {
  public let id: String
  public var x: Double
  public var y: Double
  public var frame: Int
  
  public init(id: String = UUID().uuidString,
      x: Double,
      y: Double,
      frame: Int) {
      self.id = id
      self.x = x
      self.y = y
      self.frame = frame
  }
}