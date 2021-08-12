import Foundation

protocol DataProviderProtocol {
    func getThemes(completion: @escaping (Result<[Theme], Error>) -> Void)
    func getLessons(themeID: String?, completion: @escaping (Result<[Lesson], Error>) -> Void)
    func saveLesson(lessonId: String?)
}
