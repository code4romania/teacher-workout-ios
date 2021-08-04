import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            SearchBar(text: $viewModel.searchText)
                .padding(.top, 16)

            ListHeaderView(label: AppStrings.Home.lessonsInProgress.localized())

            LessonsList(lessons: viewModel.inProgressLessons)

            ListHeaderView(label: AppStrings.Home.newLessons.localized())

            LessonsList(lessons: viewModel.newLessons)

            ListHeaderView(label: AppStrings.Discover.listDescription.localized())

            ThemesGrid(themes: viewModel.themes)

            Spacer(minLength: 30)
        }
        .navigationBarTitle(AppStrings.Home.navigationTitle.localized(),
                            displayMode: .large)
        .onAppear {
            viewModel.loadThemes()
            viewModel.loadLessons()
        }
    }
}
