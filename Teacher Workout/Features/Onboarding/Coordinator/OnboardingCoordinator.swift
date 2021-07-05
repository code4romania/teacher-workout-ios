import Foundation
import UIKit

protocol OnboardingCoordinatorDelegate: AnyObject {
    func onboardingCoordinatorDidFinish(_ coordinator: OnboardingCoordinator)
}

final class OnboardingCoordinator: NSObject, Coordinator, OnboardingPageViewControllerDelegate {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    weak var delegate: OnboardingCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let viewController = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        viewController.onboardingDelegate = self
        navigationController.pushViewController(viewController, animated: true)
        navigationController.setNavigationBarHidden(true, animated: false)
    }

    func onboardingPageViewControllerDidFinish(_: OnboardingPageViewController) {
        delegate?.onboardingCoordinatorDidFinish(self)
    }
}
