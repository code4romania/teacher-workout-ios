import SwiftUI

struct ThemeDetails: View {
    @StateObject var viewModel: ThemeDetailsViewModel

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
