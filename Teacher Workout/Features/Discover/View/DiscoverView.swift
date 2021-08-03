import SwiftUI

struct DiscoverView: View {
    @StateObject var viewModel = DiscoverViewModel()
    @State private var searchText = ""

    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding(.top, 16)

            ListHeaderView(label: AppStrings.Discover.listDescription.localized())

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(viewModel.themes) { theme in
                    ThemeItemCell(item: theme)
                        .frame(height: 57)
                }
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .navigationBarTitle(AppStrings.Discover.navigationTitle.localized(),
                            displayMode: .large)
        .onAppear {
            viewModel.loadData()
        }
    }
}
