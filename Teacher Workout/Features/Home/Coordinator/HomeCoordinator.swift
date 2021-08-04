import Foundation
import SwiftUI
import UIKit

final class HomeCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    override init() {
        let viewController = UIHostingController(rootView: HomeView())
        viewController.tabBarItem.title = AppStrings.Menu.home.localized()
        viewController.tabBarItem.image = UIImage(systemName: "house")
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
