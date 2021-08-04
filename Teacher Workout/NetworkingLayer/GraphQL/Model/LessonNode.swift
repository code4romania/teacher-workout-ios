import Foundation

typealias LessonNode = LessonsQuery.Data.Lesson.Edge.Node

extension Lesson {
    init?(lessonNode: LessonNode?) {
        guard let lesson = lessonNode else {
            return nil
        }

        id = lesson.id ?? UUID().uuidString
        title = lesson.title
        imageURL = lesson.thumbnail.url
        duration = lesson.duration.displayValue
        themeTitle = lesson.theme.title
    }
}
