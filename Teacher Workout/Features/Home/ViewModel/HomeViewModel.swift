import Foundation

final class HomeViewModel: ObservableObject {
    @Published var themes: [Theme] = []

    var searchText = ""

    private let dataProvider: DataProviderProtocol

    init(dataProvider: DataProviderProtocol = Config.dataService) {
        self.dataProvider = dataProvider
    }

    func loadThemes() {
        dataProvider.getThemes { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(value):
                self.themes = value
            default:
                break
            }
        }
    }
}
