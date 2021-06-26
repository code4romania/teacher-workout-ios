import Foundation
import UIKit

final class ApplicationCoordinator: NSObject, Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        showMenu()
    }

    private func showMenu() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        addChildCoordinator(menuCoordinator)
        menuCoordinator.start()
    }
}
