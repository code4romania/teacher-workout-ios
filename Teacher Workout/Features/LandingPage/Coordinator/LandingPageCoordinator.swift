import Foundation
import SwiftUI
import UIKit

protocol LandingPageCoordinatorDelegate: AnyObject {
    func landingPageCoordinatorShouldPresentSignIn(_ coordinator: LandingPageCoordinator)
    func landingPageCoordinatorShouldPresentSignUp(_ coordinator: LandingPageCoordinator)
}

final class LandingPageCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    weak var deleage: LandingPageCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let viewController = UIHostingController(rootView: LandingPageView(delegate: self))
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension LandingPageCoordinator: LandingPageViewDelegate {
    func landingPageViewDidTapSignIn(_: LandingPageView) {
        deleage?.landingPageCoordinatorShouldPresentSignIn(self)
    }

    func landingPageViewDidTapSignUp(_: LandingPageView) {
        deleage?.landingPageCoordinatorShouldPresentSignUp(self)
    }
}
