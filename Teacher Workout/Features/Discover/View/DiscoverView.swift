import SwiftUI

struct DiscoverView: View {
    @StateObject var viewModel = DiscoverViewModel()

    var body: some View {
        ScrollView {
            SearchBar(text: $viewModel.searchText)
                .padding(.top, 16)

            ListHeaderView(label: AppStrings.Discover.listDescription.localized())

            ThemesGrid(themes: viewModel.themes)
        }
        .navigationBarTitle(AppStrings.Discover.navigationTitle.localized(),
                            displayMode: .large)
        .onAppear {
            viewModel.loadData()
        }
    }
}
