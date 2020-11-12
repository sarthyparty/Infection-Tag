//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreatePlayerPosInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, x: Double, y: Double, frameNum: Int) {
    graphQLMap = ["id": id, "x": x, "y": y, "frameNum": frameNum]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var x: Double {
    get {
      return graphQLMap["x"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "x")
    }
  }

  public var y: Double {
    get {
      return graphQLMap["y"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "y")
    }
  }

  public var frameNum: Int {
    get {
      return graphQLMap["frameNum"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frameNum")
    }
  }
}

public struct ModelPlayerPosConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(x: ModelFloatInput? = nil, y: ModelFloatInput? = nil, frameNum: ModelIntInput? = nil, and: [ModelPlayerPosConditionInput?]? = nil, or: [ModelPlayerPosConditionInput?]? = nil, not: ModelPlayerPosConditionInput? = nil) {
    graphQLMap = ["x": x, "y": y, "frameNum": frameNum, "and": and, "or": or, "not": not]
  }

  public var x: ModelFloatInput? {
    get {
      return graphQLMap["x"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "x")
    }
  }

  public var y: ModelFloatInput? {
    get {
      return graphQLMap["y"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "y")
    }
  }

  public var frameNum: ModelIntInput? {
    get {
      return graphQLMap["frameNum"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frameNum")
    }
  }

  public var and: [ModelPlayerPosConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelPlayerPosConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelPlayerPosConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelPlayerPosConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelPlayerPosConditionInput? {
    get {
      return graphQLMap["not"] as! ModelPlayerPosConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelFloatInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Double? = nil, eq: Double? = nil, le: Double? = nil, lt: Double? = nil, ge: Double? = nil, gt: Double? = nil, between: [Double?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Double? {
    get {
      return graphQLMap["ne"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Double? {
    get {
      return graphQLMap["eq"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Double? {
    get {
      return graphQLMap["le"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Double? {
    get {
      return graphQLMap["lt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Double? {
    get {
      return graphQLMap["ge"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Double? {
    get {
      return graphQLMap["gt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Double?]? {
    get {
      return graphQLMap["between"] as! [Double?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public enum ModelAttributeTypes: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case binary
  case binarySet
  case bool
  case list
  case map
  case number
  case numberSet
  case string
  case stringSet
  case null
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "binary": self = .binary
      case "binarySet": self = .binarySet
      case "bool": self = .bool
      case "list": self = .list
      case "map": self = .map
      case "number": self = .number
      case "numberSet": self = .numberSet
      case "string": self = .string
      case "stringSet": self = .stringSet
      case "_null": self = .null
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .binary: return "binary"
      case .binarySet: return "binarySet"
      case .bool: return "bool"
      case .list: return "list"
      case .map: return "map"
      case .number: return "number"
      case .numberSet: return "numberSet"
      case .string: return "string"
      case .stringSet: return "stringSet"
      case .null: return "_null"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelAttributeTypes, rhs: ModelAttributeTypes) -> Bool {
    switch (lhs, rhs) {
      case (.binary, .binary): return true
      case (.binarySet, .binarySet): return true
      case (.bool, .bool): return true
      case (.list, .list): return true
      case (.map, .map): return true
      case (.number, .number): return true
      case (.numberSet, .numberSet): return true
      case (.string, .string): return true
      case (.stringSet, .stringSet): return true
      case (.null, .null): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelIntInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdatePlayerPosInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, x: Double? = nil, y: Double? = nil, frameNum: Int? = nil) {
    graphQLMap = ["id": id, "x": x, "y": y, "frameNum": frameNum]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var x: Double? {
    get {
      return graphQLMap["x"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "x")
    }
  }

  public var y: Double? {
    get {
      return graphQLMap["y"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "y")
    }
  }

  public var frameNum: Int? {
    get {
      return graphQLMap["frameNum"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frameNum")
    }
  }
}

public struct DeletePlayerPosInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelPlayerPosFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, x: ModelFloatInput? = nil, y: ModelFloatInput? = nil, frameNum: ModelIntInput? = nil, and: [ModelPlayerPosFilterInput?]? = nil, or: [ModelPlayerPosFilterInput?]? = nil, not: ModelPlayerPosFilterInput? = nil) {
    graphQLMap = ["id": id, "x": x, "y": y, "frameNum": frameNum, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var x: ModelFloatInput? {
    get {
      return graphQLMap["x"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "x")
    }
  }

  public var y: ModelFloatInput? {
    get {
      return graphQLMap["y"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "y")
    }
  }

  public var frameNum: ModelIntInput? {
    get {
      return graphQLMap["frameNum"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "frameNum")
    }
  }

  public var and: [ModelPlayerPosFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelPlayerPosFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelPlayerPosFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelPlayerPosFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelPlayerPosFilterInput? {
    get {
      return graphQLMap["not"] as! ModelPlayerPosFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public struct ModelSizeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public final class CreatePlayerPosMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreatePlayerPos($input: CreatePlayerPosInput!, $condition: ModelPlayerPosConditionInput) {\n  createPlayerPos(input: $input, condition: $condition) {\n    __typename\n    id\n    x\n    y\n    frameNum\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreatePlayerPosInput
  public var condition: ModelPlayerPosConditionInput?

  public init(input: CreatePlayerPosInput, condition: ModelPlayerPosConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createPlayerPos", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreatePlayerPo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createPlayerPos: CreatePlayerPo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createPlayerPos": createPlayerPos.flatMap { $0.snapshot }])
    }

    public var createPlayerPos: CreatePlayerPo? {
      get {
        return (snapshot["createPlayerPos"] as? Snapshot).flatMap { CreatePlayerPo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createPlayerPos")
      }
    }

    public struct CreatePlayerPo: GraphQLSelectionSet {
      public static let possibleTypes = ["PlayerPos"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("x", type: .nonNull(.scalar(Double.self))),
        GraphQLField("y", type: .nonNull(.scalar(Double.self))),
        GraphQLField("frameNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, x: Double, y: Double, frameNum: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "PlayerPos", "id": id, "x": x, "y": y, "frameNum": frameNum, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var x: Double {
        get {
          return snapshot["x"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "x")
        }
      }

      public var y: Double {
        get {
          return snapshot["y"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "y")
        }
      }

      public var frameNum: Int {
        get {
          return snapshot["frameNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frameNum")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class UpdatePlayerPosMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdatePlayerPos($input: UpdatePlayerPosInput!, $condition: ModelPlayerPosConditionInput) {\n  updatePlayerPos(input: $input, condition: $condition) {\n    __typename\n    id\n    x\n    y\n    frameNum\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdatePlayerPosInput
  public var condition: ModelPlayerPosConditionInput?

  public init(input: UpdatePlayerPosInput, condition: ModelPlayerPosConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updatePlayerPos", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdatePlayerPo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updatePlayerPos: UpdatePlayerPo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updatePlayerPos": updatePlayerPos.flatMap { $0.snapshot }])
    }

    public var updatePlayerPos: UpdatePlayerPo? {
      get {
        return (snapshot["updatePlayerPos"] as? Snapshot).flatMap { UpdatePlayerPo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updatePlayerPos")
      }
    }

    public struct UpdatePlayerPo: GraphQLSelectionSet {
      public static let possibleTypes = ["PlayerPos"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("x", type: .nonNull(.scalar(Double.self))),
        GraphQLField("y", type: .nonNull(.scalar(Double.self))),
        GraphQLField("frameNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, x: Double, y: Double, frameNum: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "PlayerPos", "id": id, "x": x, "y": y, "frameNum": frameNum, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var x: Double {
        get {
          return snapshot["x"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "x")
        }
      }

      public var y: Double {
        get {
          return snapshot["y"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "y")
        }
      }

      public var frameNum: Int {
        get {
          return snapshot["frameNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frameNum")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class DeletePlayerPosMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeletePlayerPos($input: DeletePlayerPosInput!, $condition: ModelPlayerPosConditionInput) {\n  deletePlayerPos(input: $input, condition: $condition) {\n    __typename\n    id\n    x\n    y\n    frameNum\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeletePlayerPosInput
  public var condition: ModelPlayerPosConditionInput?

  public init(input: DeletePlayerPosInput, condition: ModelPlayerPosConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deletePlayerPos", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeletePlayerPo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deletePlayerPos: DeletePlayerPo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deletePlayerPos": deletePlayerPos.flatMap { $0.snapshot }])
    }

    public var deletePlayerPos: DeletePlayerPo? {
      get {
        return (snapshot["deletePlayerPos"] as? Snapshot).flatMap { DeletePlayerPo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deletePlayerPos")
      }
    }

    public struct DeletePlayerPo: GraphQLSelectionSet {
      public static let possibleTypes = ["PlayerPos"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("x", type: .nonNull(.scalar(Double.self))),
        GraphQLField("y", type: .nonNull(.scalar(Double.self))),
        GraphQLField("frameNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, x: Double, y: Double, frameNum: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "PlayerPos", "id": id, "x": x, "y": y, "frameNum": frameNum, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var x: Double {
        get {
          return snapshot["x"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "x")
        }
      }

      public var y: Double {
        get {
          return snapshot["y"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "y")
        }
      }

      public var frameNum: Int {
        get {
          return snapshot["frameNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frameNum")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class GetPlayerPosQuery: GraphQLQuery {
  public static let operationString =
    "query GetPlayerPos($id: ID!) {\n  getPlayerPos(id: $id) {\n    __typename\n    id\n    x\n    y\n    frameNum\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getPlayerPos", arguments: ["id": GraphQLVariable("id")], type: .object(GetPlayerPo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getPlayerPos: GetPlayerPo? = nil) {
      self.init(snapshot: ["__typename": "Query", "getPlayerPos": getPlayerPos.flatMap { $0.snapshot }])
    }

    public var getPlayerPos: GetPlayerPo? {
      get {
        return (snapshot["getPlayerPos"] as? Snapshot).flatMap { GetPlayerPo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getPlayerPos")
      }
    }

    public struct GetPlayerPo: GraphQLSelectionSet {
      public static let possibleTypes = ["PlayerPos"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("x", type: .nonNull(.scalar(Double.self))),
        GraphQLField("y", type: .nonNull(.scalar(Double.self))),
        GraphQLField("frameNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, x: Double, y: Double, frameNum: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "PlayerPos", "id": id, "x": x, "y": y, "frameNum": frameNum, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var x: Double {
        get {
          return snapshot["x"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "x")
        }
      }

      public var y: Double {
        get {
          return snapshot["y"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "y")
        }
      }

      public var frameNum: Int {
        get {
          return snapshot["frameNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frameNum")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class ListPlayerPossQuery: GraphQLQuery {
  public static let operationString =
    "query ListPlayerPoss($filter: ModelPlayerPosFilterInput, $limit: Int, $nextToken: String) {\n  listPlayerPoss(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      x\n      y\n      frameNum\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var filter: ModelPlayerPosFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelPlayerPosFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listPlayerPoss", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListPlayerPoss.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listPlayerPoss: ListPlayerPoss? = nil) {
      self.init(snapshot: ["__typename": "Query", "listPlayerPoss": listPlayerPoss.flatMap { $0.snapshot }])
    }

    public var listPlayerPoss: ListPlayerPoss? {
      get {
        return (snapshot["listPlayerPoss"] as? Snapshot).flatMap { ListPlayerPoss(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listPlayerPoss")
      }
    }

    public struct ListPlayerPoss: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelPlayerPosConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelPlayerPosConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["PlayerPos"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("x", type: .nonNull(.scalar(Double.self))),
          GraphQLField("y", type: .nonNull(.scalar(Double.self))),
          GraphQLField("frameNum", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, x: Double, y: Double, frameNum: Int, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "PlayerPos", "id": id, "x": x, "y": y, "frameNum": frameNum, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var x: Double {
          get {
            return snapshot["x"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "x")
          }
        }

        public var y: Double {
          get {
            return snapshot["y"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "y")
          }
        }

        public var frameNum: Int {
          get {
            return snapshot["frameNum"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "frameNum")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class OnCreatePlayerPosSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreatePlayerPos {\n  onCreatePlayerPos {\n    __typename\n    id\n    x\n    y\n    frameNum\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreatePlayerPos", type: .object(OnCreatePlayerPo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreatePlayerPos: OnCreatePlayerPo? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreatePlayerPos": onCreatePlayerPos.flatMap { $0.snapshot }])
    }

    public var onCreatePlayerPos: OnCreatePlayerPo? {
      get {
        return (snapshot["onCreatePlayerPos"] as? Snapshot).flatMap { OnCreatePlayerPo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreatePlayerPos")
      }
    }

    public struct OnCreatePlayerPo: GraphQLSelectionSet {
      public static let possibleTypes = ["PlayerPos"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("x", type: .nonNull(.scalar(Double.self))),
        GraphQLField("y", type: .nonNull(.scalar(Double.self))),
        GraphQLField("frameNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, x: Double, y: Double, frameNum: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "PlayerPos", "id": id, "x": x, "y": y, "frameNum": frameNum, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var x: Double {
        get {
          return snapshot["x"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "x")
        }
      }

      public var y: Double {
        get {
          return snapshot["y"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "y")
        }
      }

      public var frameNum: Int {
        get {
          return snapshot["frameNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frameNum")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnUpdatePlayerPosSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdatePlayerPos {\n  onUpdatePlayerPos {\n    __typename\n    id\n    x\n    y\n    frameNum\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdatePlayerPos", type: .object(OnUpdatePlayerPo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdatePlayerPos: OnUpdatePlayerPo? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdatePlayerPos": onUpdatePlayerPos.flatMap { $0.snapshot }])
    }

    public var onUpdatePlayerPos: OnUpdatePlayerPo? {
      get {
        return (snapshot["onUpdatePlayerPos"] as? Snapshot).flatMap { OnUpdatePlayerPo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdatePlayerPos")
      }
    }

    public struct OnUpdatePlayerPo: GraphQLSelectionSet {
      public static let possibleTypes = ["PlayerPos"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("x", type: .nonNull(.scalar(Double.self))),
        GraphQLField("y", type: .nonNull(.scalar(Double.self))),
        GraphQLField("frameNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, x: Double, y: Double, frameNum: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "PlayerPos", "id": id, "x": x, "y": y, "frameNum": frameNum, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var x: Double {
        get {
          return snapshot["x"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "x")
        }
      }

      public var y: Double {
        get {
          return snapshot["y"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "y")
        }
      }

      public var frameNum: Int {
        get {
          return snapshot["frameNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frameNum")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnDeletePlayerPosSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeletePlayerPos {\n  onDeletePlayerPos {\n    __typename\n    id\n    x\n    y\n    frameNum\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeletePlayerPos", type: .object(OnDeletePlayerPo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeletePlayerPos: OnDeletePlayerPo? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeletePlayerPos": onDeletePlayerPos.flatMap { $0.snapshot }])
    }

    public var onDeletePlayerPos: OnDeletePlayerPo? {
      get {
        return (snapshot["onDeletePlayerPos"] as? Snapshot).flatMap { OnDeletePlayerPo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeletePlayerPos")
      }
    }

    public struct OnDeletePlayerPo: GraphQLSelectionSet {
      public static let possibleTypes = ["PlayerPos"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("x", type: .nonNull(.scalar(Double.self))),
        GraphQLField("y", type: .nonNull(.scalar(Double.self))),
        GraphQLField("frameNum", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, x: Double, y: Double, frameNum: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "PlayerPos", "id": id, "x": x, "y": y, "frameNum": frameNum, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var x: Double {
        get {
          return snapshot["x"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "x")
        }
      }

      public var y: Double {
        get {
          return snapshot["y"]! as! Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "y")
        }
      }

      public var frameNum: Int {
        get {
          return snapshot["frameNum"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "frameNum")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}