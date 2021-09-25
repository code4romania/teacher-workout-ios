import Foundation
import SwiftUI
import UIKit

final class ProfileCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    override init() {
        navigationController = UINavigationController()
        super.init()

        let viewController = UIHostingController(rootView: ProfileView(resultsDelegate: self, settingsDelegate: self))
        viewController.tabBarItem.title = AppStrings.Menu.profile.localized()
        viewController.tabBarItem.image = UIImage(systemName: "person.circle")
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)

        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "neutral")!, .font: UIFont(name: "Mulish-SemiBold", size: 18)!]
        navigationController.navigationBar.standardAppearance = coloredAppearance
        navigationController.navigationBar.scrollEdgeAppearance = coloredAppearance
    }
}

extension ProfileCoordinator: SettingsListViewDelegate {
    func settingsListView(_: SettingsListView, didSelect _: SettingsListOption) {
        #warning("Implement redirect for every setting list option")
        let viewController = UIHostingController(rootView: Text("Not implemented yet"))
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension ProfileCoordinator: ResultsListViewDelegate {
    func resultsListView(_: ResultsListView, didSelect _: ResultItem) {
        #warning("Implement redirect for every result item")
        let viewController = UIHostingController(rootView: Text("Not implemented yet"))
        navigationController.pushViewController(viewController, animated: true)
    }
}
