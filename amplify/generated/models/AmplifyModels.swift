// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "11fbcda4ddc12a428d7cf2b2ad02b2ae"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: PlayerPos.self)
  }
}