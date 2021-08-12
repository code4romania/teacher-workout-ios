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
}

extension DiscoverCoordinator: DiscoverViewDelegate {
    func discoverView(_: DiscoverView, didSelectTheme theme: Theme) {
        let viewModel = ThemeDetailsViewModel(theme: theme)

        viewModel.lessonSelected = { [weak self] lesson in
            guard let self = self else { return }

            let introView = LessonIntroView(lesson: lesson, delegate: self)
            let viewController = UIHostingController(rootView: introView)
            self.navigationController.present(viewController, animated: true)
        }

        let viewDetails = ThemeDetails(viewModel: viewModel)
        let viewController = UIHostingController(rootView: viewDetails)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension DiscoverCoordinator: LessonIntroViewDelegate {
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
