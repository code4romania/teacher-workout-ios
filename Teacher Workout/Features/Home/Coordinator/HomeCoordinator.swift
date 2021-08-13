import Foundation
import SwiftUI
import UIKit

final class HomeCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    var themeDetailsViewModel: ThemeDetailsViewModel?

    override init() {
        navigationController = UINavigationController()
        super.init()

        let homeView = HomeView(delegate: self)
        let viewController = UIHostingController(rootView: homeView)
        viewController.tabBarItem.title = AppStrings.Menu.home.localized()
        viewController.tabBarItem.image = UIImage(systemName: "house")
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
    }

    // MARK: - LessonIntroView Interaction

    func presentLessonIntroView(_ lesson: Lesson) {
        let introView = LessonIntroView(lesson: lesson, delegate: self)
        let viewController = UIHostingController(rootView: introView)
        navigationController.present(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeViewDelegate {
    func homeView(_: HomeView, didSelectTheme theme: Theme) {
        let viewModel = ThemeDetailsViewModel(theme: theme)
        let viewDetails = ThemeDetails(viewModel: viewModel, delegate: self)

        let viewController = UIHostingController(rootView: viewDetails)
        navigationController.pushViewController(viewController, animated: true)
    }

    func homeView(_: HomeView, didSelectLesson lesson: Lesson) {
        presentLessonIntroView(lesson)
    }
}

extension HomeCoordinator: LessonIntroViewDelegate {
    func lessonIntroViewDidTapClose(_: LessonIntroView) {
        navigationController.dismiss(animated: true)
    }

    func lessonIntroViewDidTapStartLesson(_: LessonIntroView) {
        navigationController.dismiss(animated: true)
    }

    func lessonIntroViewDidTapSaveLesson(_: LessonIntroView) {
        navigationController.dismiss(animated: true)
    }
}

extension HomeCoordinator: ThemeDetailsDelegate {
    func themeDetails(_: ThemeDetails, didSelectLesson lesson: Lesson) {
        presentLessonIntroView(lesson)
    }
}
