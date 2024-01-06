import Foundation
import SwiftUI

final class ExerciseViewModel: ObservableObject {
    @Published var currentQuestionIndex: Int = 10
    @Published var isVerifying: Bool = false
    @Published var exercise: Exercise?
    @Published var selectedAnswer: Answer?
    
    private let dataProvider: DataProviderProtocol

    init(dataProvider: DataProviderProtocol = Config.dataService) {
        self.dataProvider = dataProvider
    }
    
    var isSelectedAnswerValid: Bool {
        selectedAnswer != nil
    }
    
    /// TODO: Load the exercise from the API
    func loadExercise() {
        self.exercise = Exercise(
            question: "Aici este textul unei intrebari bazate pe informatii parcurse in ecranele anterioare",
            answers: [
                Answer(description: "Raspuns 1", isCorrect: false),
                Answer(description: "Raspuns 2", isCorrect: true),
                Answer(description: "Raspuns 3", isCorrect: false),
            ])
    }
}
