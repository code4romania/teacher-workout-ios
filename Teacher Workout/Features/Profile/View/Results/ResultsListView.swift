import SwiftUI

protocol ResultsListViewDelegate {
    func resultsListView(_ view: ResultsListView, didSelect item: ResultItem)
}

struct ResultsListView: View {
    @StateObject var viewModel = ResultsListViewModel()

    var delegate: ResultsListViewDelegate?

    var body: some View {
        List(viewModel.items) { item in
            ResultsListItem(item: item)
                .onTapGesture {
                    self.delegate?.resultsListView(self, didSelect: item)
                }
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.loadData()
        }
    }
}
