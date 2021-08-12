import Foundation

final class LessonIntroViewModel: ObservableObject {
    private let dataProvider: DataProviderProtocol

    init(dataProvider: DataProviderProtocol = Config.dataService) {
        self.dataProvider = dataProvider
    }

    func saveLesson(lessonId: String) {
        dataProvider.saveLesson(lessonId: lessonId)
    }
}
