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
        let viewController = HomeViewController()
        viewController.tabBarItem.title = AppStrings.Menu.home.localized()
        viewController.tabBarItem.image = UIImage(systemName: "house")
        return viewController
    }

    private func createDiscover() -> UIViewController {
        let viewController = DiscoverViewController()
        viewController.tabBarItem.title = AppStrings.Menu.discover.localized()
        viewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        return viewController
    }

    private func createProfile() -> UIViewController {
        let viewController = ProfileViewController()
        viewController.tabBarItem.title = AppStrings.Menu.profile.localized()
        viewController.tabBarItem.image = UIImage(systemName: "person.circle")
        return viewController
    }
}
