import Foundation

final class HomeViewModel: ObservableObject {
    @Published var themes: [Theme] = []
    @Published var newLessons: [Lesson] = []
    @Published var inProgressLessons: [Lesson] = []

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

    func loadLessons() {
        dataProvider.getLessons(themeID: nil) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(value):
                // TODO: Get proper data from API when ready
                self.inProgressLessons = Array(value.prefix(2))
                self.newLessons = Array(value.suffix(3))
            default:
                break
            }
        }
    }
}
