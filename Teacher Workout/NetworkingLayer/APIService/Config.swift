import Foundation

struct Config {
    static var dataService: DataProviderProtocol = GraphAPIService()
}
