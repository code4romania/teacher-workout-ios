import SwiftUI

struct ResultsListView: View {
    @StateObject var viewModel = ResultsListViewModel()

    var body: some View {
        List(viewModel.items) { item in
            ResultsListItem(item: item)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.loadData()
        }
    }
}
