import Foundation
import SwiftUI
import UIKit

class LessonCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    private var lesson: Lesson
    private var internalNavigation: UINavigationController?

    init(navigationController: UINavigationController, lesson: Lesson) {
        self.navigationController = navigationController
        self.lesson = lesson
    }

    func start() {
        let introView = LessonIntroView(lesson: lesson, delegate: self)
        let viewController = UIHostingController(rootView: introView)
        let navController = UINavigationController(rootViewController: viewController)
        navController.modalPresentationStyle = .fullScreen
        internalNavigation = navController
        navigationController.present(navController, animated: true)
    }
}

extension LessonCoordinator: LessonIntroViewDelegate {
    func lessonIntroViewDidTapClose(_: LessonIntroView) {
        navigationController.dismiss(animated: true)
        // TODO:
    }

    func lessonIntroViewDidTapStartLesson(_ view: LessonIntroView, lesson _: Lesson) {
        let view = LessonFinishedView()
        let hostingController = UIHostingController(rootView: view)
        internalNavigation?.pushViewController(hostingController, animated: true)
    }

    func lessonIntroViewDidTapSaveLesson(_: LessonIntroView) {
        navigationController.dismiss(animated: true)
        // TODO:
    }
}
