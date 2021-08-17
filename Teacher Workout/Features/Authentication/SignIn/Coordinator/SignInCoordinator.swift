import Foundation
import SwiftUI
import UIKit

protocol SignInCoordinatorDelegate: AnyObject {
    func signInCoordinatorDidClose(_ coordinator: SignInCoordinator)
    func signInCoordinatorDidTapSignIn(_ coordinator: SignInCoordinator)
}

final class SignInCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    private var topNavigation: UINavigationController?

    weak var delegate: SignInCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let viewController = UIHostingController(rootView: SignInView(delegate: self))
        let navigation = UINavigationController(rootViewController: viewController)
        topNavigation = navigation
        navigationController.present(navigation, animated: true)
    }
}

extension SignInCoordinator: SignInViewDelegate, ResetPasswordViewDelegate {
    func signInViewDidTapClose(_: SignInView) {
        navigationController.dismiss(animated: true)
        delegate?.signInCoordinatorDidClose(self)
    }

    func signInViewDidTapSignIn(_: SignInView) {
        navigationController.dismiss(animated: true)
        delegate?.signInCoordinatorDidTapSignIn(self)
    }

    func signInViewDidTapForgotPassword(_: SignInView) {
        let viewController = UIHostingController(rootView: ResetPasswordView(delegate: self))
        topNavigation?.present(viewController, animated: true)
    }

    func resetPasswordViewDidTapClose(_: ResetPasswordView) {
        topNavigation?.dismiss(animated: true)
    }
}
