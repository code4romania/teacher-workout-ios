import Foundation

struct ResultItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let progress: String
    let progressValue: Double
}

extension ResultItem {
    static var mockedData: [ResultItem] = [
        ResultItem(title: "Lectii parcurse", image: "results_item", progress: "15/210", progressValue: 20.0),
        ResultItem(title: "Categoria 1", image: "results_item", progress: "4/8", progressValue: 30.0),
        ResultItem(title: "Categoria 2", image: "results_item", progress: "5/30", progressValue: 10.0),
        ResultItem(title: "Categoria 3", image: "results_item", progress: "2/5", progressValue: 80.0),
        ResultItem(title: "Categoria 4", image: "results_item", progress: "18/300", progressValue: 5.0),
    ]
}
