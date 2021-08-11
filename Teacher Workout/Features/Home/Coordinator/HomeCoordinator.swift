import Foundation
import SwiftUI
import UIKit

final class HomeCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

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
}

extension HomeCoordinator: HomeViewDelegate {
    func homeView(_: HomeView, didSelectTheme theme: Theme) {
        let viewModel = ThemeDetailsViewModel(theme: theme)
        let viewDetails = ThemeDetails(viewModel: viewModel)

        viewModel.lessonSelected = { [weak self] lesson in
            guard let self = self else { return }

            let introView = LessonIntroView(lesson: lesson)
            let viewController = UIHostingController(rootView: introView)
            self.navigationController.pushViewController(viewController, animated: true)
        }

        let viewController = UIHostingController(rootView: viewDetails)
        navigationController.pushViewController(viewController, animated: true)
    }

    func homeView(_: HomeView, didSelectLesson lesson: Lesson) {
        let introView = LessonIntroView(lesson: lesson)
        let viewController = UIHostingController(rootView: introView)
        navigationController.pushViewController(viewController, animated: true)
    }
}
