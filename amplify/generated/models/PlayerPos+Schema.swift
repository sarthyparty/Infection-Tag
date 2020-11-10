// swiftlint:disable all
import Amplify
import Foundation

extension PlayerPos {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case x
    case y
    case frameNum
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let playerPos = PlayerPos.keys
    
    model.pluralName = "PlayerPos"
    
    model.fields(
      .id(),
      .field(playerPos.x, is: .required, ofType: .double),
      .field(playerPos.y, is: .required, ofType: .double),
      .field(playerPos.frameNum, is: .required, ofType: .int)
    )
    }
}