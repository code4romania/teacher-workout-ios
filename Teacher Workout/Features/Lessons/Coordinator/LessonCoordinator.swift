import Foundation
import SwiftUI
import UIKit

class LessonCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    private var lesson: Lesson

    init(navigationController: UINavigationController, lesson: Lesson) {
        self.navigationController = navigationController
        self.lesson = lesson
    }

    func start() {
        let introView = LessonIntroView(lesson: lesson, delegate: self)
        let viewController = UIHostingController(rootView: introView)
        viewController.modalPresentationStyle = .fullScreen
        navigationController.present(viewController, animated: true)
    }
}

extension LessonCoordinator: LessonIntroViewDelegate {
    func lessonIntroViewDidTapClose(_: LessonIntroView) {
        navigationController.dismiss(animated: true)
        // TODO:
    }

    func lessonIntroViewDidTapStartLesson(_: LessonIntroView, lesson _: Lesson) {
        navigationController.dismiss(animated: true)
        // TODO:
    }

    func lessonIntroViewDidTapSaveLesson(_: LessonIntroView) {
        navigationController.dismiss(animated: true)
        // TODO:
    }
}
