import SwiftUI

struct ThemeDetails: View {
    @ObservedObject var viewModel: ThemeDetailsViewModel

    var body: some View {
        ScrollView {
            LessonsList(lessons: viewModel.lessons)
                .padding(.vertical, 20)
        }
        .navigationBarTitle(viewModel.themeTitle,
                            displayMode: .large)
        .onAppear {
            viewModel.loadLessons()
        }
    }
}
