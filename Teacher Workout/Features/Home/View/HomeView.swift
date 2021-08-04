import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            SearchBar(text: $viewModel.searchText)
                .padding(.top, 16)

            ListHeaderView(label: AppStrings.Home.lessonsInProgress.localized())

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 290), spacing: 15)], spacing: 15) {
                ForEach(viewModel.inProgressLessons) { lesson in
                    LessonItemCell(item: lesson)
                        .frame(maxHeight: 74)
                }
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            ListHeaderView(label: AppStrings.Home.newLessons.localized())

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 290), spacing: 15)], spacing: 15) {
                ForEach(viewModel.newLessons) { lesson in
                    LessonItemCell(item: lesson)
                        .frame(maxHeight: 74)
                }
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            ListHeaderView(label: AppStrings.Discover.listDescription.localized())

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(viewModel.themes) { theme in
                    ThemeItemCell(item: theme)
                        .frame(maxHeight: 57)
                }
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .navigationBarTitle(AppStrings.Home.navigationTitle.localized(),
                            displayMode: .large)
        .onAppear {
            viewModel.loadThemes()
            viewModel.loadLessons()
        }
    }
}
