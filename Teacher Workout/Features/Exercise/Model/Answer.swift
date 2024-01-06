import Foundation

struct Answer {
    let description: String
    let isCorrect: Bool
}

extension Answer: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}
