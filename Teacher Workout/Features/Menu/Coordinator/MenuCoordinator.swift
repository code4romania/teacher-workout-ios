import Foundation
import UIKit

final class MenuCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let menuTabBarController = MenuTabBarController()
        populateMenu(tabBarController: menuTabBarController)
        navigationController.setViewControllers([menuTabBarController], animated: false)
    }

    private func populateMenu(tabBarController: MenuTabBarController) {
        let homeViewController = createHome()
        let discoverViewController = createDiscover()
        let profileViewController = createProfile()

        tabBarController.viewControllers = [
            homeViewController,
            discoverViewController,
            profileViewController,
        ]
    }

    private func createHome() -> UIViewController {
        let coordinator = HomeCoordinator()
        addChildCoordinator(coordinator)
        return coordinator.navigationController
    }

    private func createDiscover() -> UIViewController {
        let coordinator = DiscoverCoordinator()
        addChildCoordinator(coordinator)
        return coordinator.navigationController
    }

    private func createProfile() -> UIViewController {
        let coordinator = ProfileCoordinator()
        addChildCoordinator(coordinator)
        return coordinator.navigationController
    }
}
