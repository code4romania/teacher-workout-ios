// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct LessonSaveInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - lessonId
  public init(lessonId: GraphQLID) {
    graphQLMap = ["lessonId": lessonId]
  }

  public var lessonId: GraphQLID {
    get {
      return graphQLMap["lessonId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lessonId")
    }
  }
}

public final class LessonsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Lessons($themeId: ID) {
      lessons(themeId: $themeId) {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            title
            thumbnail {
              __typename
              url
              description
            }
            theme {
              __typename
              title
            }
            duration {
              __typename
              displayValue
            }
          }
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
        GraphQLField("lessons", arguments: ["themeId": GraphQLVariable("themeId")], type: .object(Lesson.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(lessons: Lesson? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "lessons": lessons.flatMap { (value: Lesson) -> ResultMap in value.resultMap }])
    }

    public var lessons: Lesson? {
      get {
        return (resultMap["lessons"] as? ResultMap).flatMap { Lesson(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "lessons")
      }
    }

    public struct Lesson: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LessonConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "LessonConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of all of the edges returned in the connection.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LessonEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "LessonEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Lesson"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("thumbnail", type: .nonNull(.object(Thumbnail.selections))),
              GraphQLField("theme", type: .nonNull(.object(Theme.selections))),
              GraphQLField("duration", type: .nonNull(.object(Duration.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, title: String, thumbnail: Thumbnail, theme: Theme, duration: Duration) {
            self.init(unsafeResultMap: ["__typename": "Lesson", "id": id, "title": title, "thumbnail": thumbnail.resultMap, "theme": theme.resultMap, "duration": duration.resultMap])
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

          /// The thumbnail of the Lesson
          public var thumbnail: Thumbnail {
            get {
              return Thumbnail(unsafeResultMap: resultMap["thumbnail"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "thumbnail")
            }
          }

          /// The Theme of the Lesson
          public var theme: Theme {
            get {
              return Theme(unsafeResultMap: resultMap["theme"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "theme")
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

          public struct Thumbnail: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Image"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
                GraphQLField("description", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String, description: String) {
              self.init(unsafeResultMap: ["__typename": "Image", "url": url, "description": description])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// URL to the image.
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// Image description for accessibility.
            public var description: String {
              get {
                return resultMap["description"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }
          }

          public struct Theme: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Theme"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String) {
              self.init(unsafeResultMap: ["__typename": "Theme", "title": title])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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
  }
}

public final class SaveMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Save($input: LessonSaveInput!) {
      lessonSave(input: $input) {
        __typename
        lesson {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "Save"

  public var input: LessonSaveInput

  public init(input: LessonSaveInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("lessonSave", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(LessonSave.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(lessonSave: LessonSave) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "lessonSave": lessonSave.resultMap])
    }

    public var lessonSave: LessonSave {
      get {
        return LessonSave(unsafeResultMap: resultMap["lessonSave"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "lessonSave")
      }
    }

    public struct LessonSave: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LessonSavePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("lesson", type: .nonNull(.object(Lesson.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(lesson: Lesson) {
        self.init(unsafeResultMap: ["__typename": "LessonSavePayload", "lesson": lesson.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The newly created lesson.
      public var lesson: Lesson {
        get {
          return Lesson(unsafeResultMap: resultMap["lesson"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "lesson")
        }
      }

      public struct Lesson: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Lesson"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil) {
          self.init(unsafeResultMap: ["__typename": "Lesson", "id": id])
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
      }
    }
  }
}

public final class ThemesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Themes {
      themes {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            title
            thumbnail {
              __typename
              url
              description
            }
          }
        }
      }
    }
    """

  public let operationName: String = "Themes"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("themes", type: .object(Theme.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(themes: Theme? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "themes": themes.flatMap { (value: Theme) -> ResultMap in value.resultMap }])
    }

    public var themes: Theme? {
      get {
        return (resultMap["themes"] as? ResultMap).flatMap { Theme(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "themes")
      }
    }

    public struct Theme: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ThemeConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ThemeConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of all of the edges returned in the connection.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ThemeEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "ThemeEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Theme"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("thumbnail", type: .nonNull(.object(Thumbnail.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, title: String, thumbnail: Thumbnail) {
            self.init(unsafeResultMap: ["__typename": "Theme", "id": id, "title": title, "thumbnail": thumbnail.resultMap])
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

          /// The thumbnail of the Theme
          public var thumbnail: Thumbnail {
            get {
              return Thumbnail(unsafeResultMap: resultMap["thumbnail"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "thumbnail")
            }
          }

          public struct Thumbnail: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Image"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
                GraphQLField("description", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String, description: String) {
              self.init(unsafeResultMap: ["__typename": "Image", "url": url, "description": description])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// URL to the image.
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// Image description for accessibility.
            public var description: String {
              get {
                return resultMap["description"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }
          }
        }
      }
    }
  }
}
