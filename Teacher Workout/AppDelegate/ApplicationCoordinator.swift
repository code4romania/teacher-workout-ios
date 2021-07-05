import Foundation
import UIKit

final class ApplicationCoordinator: NSObject, Coordinator, OnboardingCoordinatorDelegate {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let defaults = UserDefaults.standard
        if let _ = defaults.object(forKey: "OnboardingDone") as? Bool {
            showMenu()
        } else {
            let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
            onboardingCoordinator.delegate = self
            addChildCoordinator(onboardingCoordinator)
            onboardingCoordinator.start()
        }
    }

    private func showMenu() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        addChildCoordinator(menuCoordinator)
        menuCoordinator.start()
    }

    func onboardingCoordinatorDidFinish(_ coordinator: OnboardingCoordinator) {
        removeChildCoordinator(coordinator)
        showMenu()
    }
}
