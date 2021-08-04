import Foundation

protocol DataProviderProtocol {
    func getThemes(completion: @escaping (Result<[Theme], Error>) -> Void)
    func getLessons(completion: @escaping (Result<[Lesson], Error>) -> Void)
}
