import Foundation
import SwiftUI
import UIKit

final class ExerciseCoordinator: NSObject, Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    private var exercise: Exercise
    private var submittedAnswer: Answer?
    
    init(navigationController: UINavigationController, exercise: Exercise) {
        self.navigationController = navigationController
        self.exercise = exercise
    }
    
    func start() {
        let exerciseView = ExerciseView(exercise: exercise, delegate: self)
        let viewController = UIHostingController(rootView: exerciseView)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension ExerciseCoordinator: ExerciseViewDelegate {
    func didSubmitAnswer(_ answer: Answer) {
        // TODO: Do something with the answer
        self.submittedAnswer = answer

        self.navigationController.popViewController(animated: true)
    }
}
