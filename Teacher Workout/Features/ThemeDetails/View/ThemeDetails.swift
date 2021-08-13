import SwiftUI

protocol ThemeDetailsDelegate {
    func themeDetails(_: ThemeDetails, didSelectLesson lesson: Lesson)
}

struct ThemeDetails: View {
    @ObservedObject var viewModel: ThemeDetailsViewModel

    var delegate: ThemeDetailsDelegate?

    var body: some View {
        ScrollView {
            LessonsList(lessons: viewModel.lessons, delegate: self)
                .padding(.vertical, 20)
        }
        .navigationBarTitle(viewModel.themeTitle,
                            displayMode: .large)
        .onAppear {
            viewModel.loadLessons()
        }
    }
}

extension ThemeDetails: LessonsListDelegate {
    func lessonsList(_: LessonsList, didSelectLesson lesson: Lesson) {
        delegate?.themeDetails(self, didSelectLesson: lesson)
    }
}
