import Foundation
import SwiftUI
import UIKit

final class DiscoverCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    override init() {
        navigationController = UINavigationController()
        super.init()

        let discoverView = DiscoverView(delegate: self)
        let viewController = UIHostingController(rootView: discoverView)
        viewController.tabBarItem.title = AppStrings.Menu.discover.localized()
        viewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
    }

    // MARK: - LessonIntroView Interaction

    func presentLessonIntroView(_ lesson: Lesson) {
        let coordinator = LessonCoordinator(navigationController: navigationController, lesson: lesson)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

extension DiscoverCoordinator: DiscoverViewDelegate {
    func discoverView(_: DiscoverView, didSelectTheme theme: Theme) {
        let viewModel = ThemeDetailsViewModel(theme: theme)
        let viewDetails = ThemeDetails(viewModel: viewModel, delegate: self)
        let viewController = UIHostingController(rootView: viewDetails)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension DiscoverCoordinator: ThemeDetailsDelegate {
    func themeDetails(_: ThemeDetails, didSelectLesson lesson: Lesson) {
        presentLessonIntroView(lesson)
    }
}
