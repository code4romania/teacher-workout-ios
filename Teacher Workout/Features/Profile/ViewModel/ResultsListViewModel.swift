import Foundation

class ResultsListViewModel: ObservableObject {
    @Published var items: [ResultItem] = []

    func loadData() {
        items = ResultItem.mockedData
    }
}
