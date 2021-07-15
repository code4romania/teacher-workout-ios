import Foundation
import SwiftUI
import UIKit

final class SignUpCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    func start() {
        let viewController = UIHostingController(rootView: SignUpView())
        navigationController.pushViewController(viewController, animated: true)
    }
}
