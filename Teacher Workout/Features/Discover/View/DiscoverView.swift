import SwiftUI

protocol DiscoverViewDelegate {
    func discoverView(_ view: DiscoverView, didSelectTheme theme: Theme)
}

struct DiscoverView: View {
    @StateObject var viewModel = DiscoverViewModel()
    var delegate: DiscoverViewDelegate?

    var body: some View {
        ScrollView {
            SearchBar(text: $viewModel.searchText)
                .padding(.top, 16)

            ListHeaderView(label: AppStrings.Discover.listDescription.localized())

            ThemesGrid(themes: viewModel.themes, delegate: self)
        }
        .navigationBarTitle(AppStrings.Discover.navigationTitle.localized(),
                            displayMode: .large)
        .onAppear {
            viewModel.loadData()
        }
    }
}

extension DiscoverView: ThemesGridDelegate {
    func themesGrid(_: ThemesGrid, didSelectTheme theme: Theme) {
        delegate?.discoverView(self, didSelectTheme: theme)
    }
}
