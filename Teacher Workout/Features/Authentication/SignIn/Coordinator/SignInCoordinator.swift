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

    weak var delegate: SignInCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let viewController = UIHostingController(rootView: SignInView(delegate: self))
        navigationController.present(viewController, animated: true)
    }
}

extension SignInCoordinator: SignInViewDelegate {
    func signInViewDidTapClose(_: SignInView) {
        navigationController.dismiss(animated: true)
        delegate?.signInCoordinatorDidClose(self)
    }

    func signInViewDidTapSignIn(_: SignInView) {
        navigationController.dismiss(animated: true)
        delegate?.signInCoordinatorDidClose(self)
        delegate?.signInCoordinatorDidTapSignIn(self)
    }
}
