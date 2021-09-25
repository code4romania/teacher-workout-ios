import Foundation
import SwiftUI
import UIKit

final class ProfileCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    override init() {
        let viewController = UIHostingController(rootView: ProfileView())
        viewController.tabBarItem.title = AppStrings.Menu.profile.localized()
        viewController.tabBarItem.image = UIImage(systemName: "person.circle")
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}
