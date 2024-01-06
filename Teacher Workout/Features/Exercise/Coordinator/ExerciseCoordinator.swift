import Foundation
import SwiftUI
import UIKit

protocol ExerciseCoordinatorDelegate: AnyObject {
    func exerciseDidFinish(_ answer: Answer, coordinator: ExerciseCoordinator)
}

final class ExerciseCoordinator: NSObject, Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    private var submittedAnswer: Answer?
    
    weak var delegate: ExerciseCoordinatorDelegate?
    
    init(navigationController: UINavigationController, delegate: ExerciseCoordinatorDelegate?) {
        self.navigationController = navigationController
        self.delegate = delegate
    }
    
    func start() {
        let exerciseView = ExerciseView(delegate: self)
        let viewController = UIHostingController(rootView: exerciseView)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension ExerciseCoordinator: ExerciseViewDelegate {
    func didSubmitAnswer(_ answer: Answer) {
        // TODO: Do something with the answer
        delegate?.exerciseDidFinish(answer, coordinator: self)
    }
}
