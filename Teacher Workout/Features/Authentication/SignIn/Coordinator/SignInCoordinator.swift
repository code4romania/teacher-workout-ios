import Foundation
import SwiftUI
import UIKit

final class SignInCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let viewController = UIHostingController(rootView: SignInView())
        navigationController.pushViewController(viewController, animated: true)
    }
}
