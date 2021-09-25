import SwiftUI

struct ResultsListView: View {
    @StateObject var viewModel = ResultsListViewModel()

    var body: some View {
        List(viewModel.items) { item in
            Text(item.title)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.loadData()
        }
    }
}
