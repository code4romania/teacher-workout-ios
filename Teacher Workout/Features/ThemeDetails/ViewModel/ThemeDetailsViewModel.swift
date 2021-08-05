import Foundation

class ThemeDetailsViewModel: ObservableObject {
    @Published var lessons: [Lesson] = []

    private var theme: Theme
    private let dataProvider: DataProviderProtocol

    init(theme: Theme, dataProvider: DataProviderProtocol = Config.dataService) {
        self.theme = theme
        self.dataProvider = dataProvider
    }

    var themeTitle: String {
        theme.title
    }

    func loadLessons() {
        dataProvider.getLessons(themeID: theme.id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(value):
                self.lessons = value
            default:
                break
            }
        }
    }
}
