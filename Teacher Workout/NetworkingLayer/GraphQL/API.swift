// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LessonsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Lessons($themeId: ID) {
      lessons(themeId: $themeId) {
        __typename
        id
        title
        duration {
          __typename
          displayValue
        }
      }
    }
    """

  public let operationName: String = "Lessons"

  public var themeId: GraphQLID?

  public init(themeId: GraphQLID? = nil) {
    self.themeId = themeId
  }

  public var variables: GraphQLMap? {
    return ["themeId": themeId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("lessons", arguments: ["themeId": GraphQLVariable("themeId")], type: .list(.object(Lesson.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(lessons: [Lesson?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "lessons": lessons.flatMap { (value: [Lesson?]) -> [ResultMap?] in value.map { (value: Lesson?) -> ResultMap? in value.flatMap { (value: Lesson) -> ResultMap in value.resultMap } } }])
    }

    public var lessons: [Lesson?]? {
      get {
        return (resultMap["lessons"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Lesson?] in value.map { (value: ResultMap?) -> Lesson? in value.flatMap { (value: ResultMap) -> Lesson in Lesson(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Lesson?]) -> [ResultMap?] in value.map { (value: Lesson?) -> ResultMap? in value.flatMap { (value: Lesson) -> ResultMap in value.resultMap } } }, forKey: "lessons")
      }
    }

    public struct Lesson: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Lesson"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("duration", type: .nonNull(.object(Duration.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, title: String, duration: Duration) {
        self.init(unsafeResultMap: ["__typename": "Lesson", "id": id, "title": title, "duration": duration.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The title of the Lesson
      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// The duration of the Lesson
      public var duration: Duration {
        get {
          return Duration(unsafeResultMap: resultMap["duration"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "duration")
        }
      }

      public struct Duration: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Duration"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("displayValue", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(displayValue: String) {
          self.init(unsafeResultMap: ["__typename": "Duration", "displayValue": displayValue])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Formatted duration.
        public var displayValue: String {
          get {
            return resultMap["displayValue"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "displayValue")
          }
        }
      }
    }
  }
}

public final class ThemesQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ThemesQuery {
      themes {
        __typename
        id
        title
      }
    }
    """

  public let operationName: String = "ThemesQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("themes", type: .list(.object(Theme.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(themes: [Theme?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "themes": themes.flatMap { (value: [Theme?]) -> [ResultMap?] in value.map { (value: Theme?) -> ResultMap? in value.flatMap { (value: Theme) -> ResultMap in value.resultMap } } }])
    }

    public var themes: [Theme?]? {
      get {
        return (resultMap["themes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Theme?] in value.map { (value: ResultMap?) -> Theme? in value.flatMap { (value: ResultMap) -> Theme in Theme(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Theme?]) -> [ResultMap?] in value.map { (value: Theme?) -> ResultMap? in value.flatMap { (value: Theme) -> ResultMap in value.resultMap } } }, forKey: "themes")
      }
    }

    public struct Theme: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Theme"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, title: String) {
        self.init(unsafeResultMap: ["__typename": "Theme", "id": id, "title": title])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The title of the Theme
      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }
    }
  }
}
