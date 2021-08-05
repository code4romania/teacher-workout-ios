import SwiftUI

protocol HomeViewDelegate {
    func homeView(_ view: HomeView, didSelectTheme theme: Theme)
}

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var delegate: HomeViewDelegate?

    var body: some View {
        ScrollView {
            SearchBar(text: $viewModel.searchText)
                .padding(.top, 16)

            ListHeaderView(label: AppStrings.Home.lessonsInProgress.localized())

            LessonsList(lessons: viewModel.inProgressLessons)

            ListHeaderView(label: AppStrings.Home.newLessons.localized())

            LessonsList(lessons: viewModel.newLessons)

            ListHeaderView(label: AppStrings.Discover.listDescription.localized())

            ThemesGrid(themes: viewModel.themes, delegate: self)

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

extension HomeView: ThemesGridDelegate {
    func themesGrid(_: ThemesGrid, didSelectTheme theme: Theme) {
        delegate?.homeView(self, didSelectTheme: theme)
    }
}
