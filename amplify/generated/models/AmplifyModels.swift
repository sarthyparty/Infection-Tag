// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "27eec5e29b709fe78c4a37214d328e7b"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: PlayerPos.self)
  }
}