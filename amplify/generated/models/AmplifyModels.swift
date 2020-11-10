// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "13ac5c0fb0b2413a0af3302f9412e388"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: PlayerPos.self)
  }
}