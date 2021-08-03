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
        showLandingPage()
    }

    private func showLandingPage() {
        let landingPageCoordinator = LandingPageCoordinator(navigationController: navigationController)
        addChildCoordinator(landingPageCoordinator)
        landingPageCoordinator.delegate = self
        landingPageCoordinator.start()
    }

    private func showMenu() {
        let menuCoordinator = MenuCoordinator(navigationController: navigationController)
        addChildCoordinator(menuCoordinator)
        menuCoordinator.start()
    }

    private func showSignInPage() {
        let coordinator = SignInCoordinator(navigationController: navigationController)
        addChildCoordinator(coordinator)
        coordinator.delegate = self
        coordinator.start()
    }

    private func showSignUpPage() {
        let coordinator = SignUpCoordinator(navigationController: navigationController)
        addChildCoordinator(coordinator)
        coordinator.delegate = self
        coordinator.start()
    }

    func onboardingCoordinatorDidFinish(_ coordinator: OnboardingCoordinator) {
        removeChildCoordinator(coordinator)
        showMenu()
    }
}

extension ApplicationCoordinator: LandingPageCoordinatorDelegate {
    func landingPageCoordinatorShouldPresentSignIn(_ coordinator: LandingPageCoordinator) {
        removeChildCoordinator(coordinator)
        showSignInPage()
    }

    func landingPageCoordinatorShouldPresentSignUp(_ coordinator: LandingPageCoordinator) {
        removeChildCoordinator(coordinator)
        showSignUpPage()
    }
}

extension ApplicationCoordinator: SignInCoordinatorDelegate {
    func signInCoordinatorDidClose(_ coordinator: SignInCoordinator) {
        removeChildCoordinator(coordinator)
    }

    func signInCoordinatorDidTapSignIn(_ coordinator: SignInCoordinator) {
        removeChildCoordinator(coordinator)
        showMenu()
    }
}

extension ApplicationCoordinator: SignUpCoordinatorDelegate {
    func signUpCoordinatorDidClose(_ coordinator: SignUpCoordinator) {
        removeChildCoordinator(coordinator)
    }

    func signUpCoordinatorDidTapHaveAccount(_ coordinator: SignUpCoordinator) {
        removeChildCoordinator(coordinator)
        showSignInPage()
    }

    func signUpCoordinatorDidTapSignUp(_ coordinator: SignUpCoordinator) {
        removeChildCoordinator(coordinator)
        showMenu()
    }
}
