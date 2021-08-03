import Foundation
import SwiftUI
import UIKit

protocol SignUpCoordinatorDelegate: AnyObject {
    func signUpCoordinatorDidClose(_ coordinator: SignUpCoordinator)
    func signUpCoordinatorDidTapHaveAccount(_ coordinator: SignUpCoordinator)
    func signUpCoordinatorDidTapSignUp(_ coordinator: SignUpCoordinator)
}

final class SignUpCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    weak var delegate: SignUpCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let viewController = UIHostingController(rootView: SignUpView(delegate: self))
        navigationController.present(viewController, animated: true)
    }
}

extension SignUpCoordinator: SignUpViewDelegate {
    func signUpViewDidTapClose(_: SignUpView) {
        navigationController.dismiss(animated: true)
        delegate?.signUpCoordinatorDidClose(self)
    }

    func signUpViewDidTapHaveAccount(_: SignUpView) {
        navigationController.dismiss(animated: true)
        delegate?.signUpCoordinatorDidTapHaveAccount(self)
    }

    func signUpViewDidTapSignUp(_: SignUpView) {
        navigationController.dismiss(animated: true)
        delegate?.signUpCoordinatorDidTapSignUp(self)
    }
}
