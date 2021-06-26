import Foundation

protocol DataProviderProtocol {
    func getThemes(completion: @escaping (Result<[Theme], Error>) -> Void)
}
