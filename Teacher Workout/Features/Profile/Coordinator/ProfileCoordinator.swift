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
        coloredAppearance.titleTextAttributes = [.foregroundColor: Color.neutral.uiColor, .font: UIFont(name: "Mulish-SemiBold", size: 18)!]
        navigationController.navigationBar.standardAppearance = coloredAppearance
        navigationController.navigationBar.scrollEdgeAppearance = coloredAppearance
    }
}

extension ProfileCoordinator: SettingsListViewDelegate {
    func settingsListView(_: SettingsListView, didSelect item: SettingsListOption) {
        #warning("Implement redirect for every setting list option")

        switch item {
        case .changeImage:
            presentChangeImageAlert()
        case .deleteAccount:
            presentDeleteAccountAlert()
        case .changePassword:
            presentChangePassword()
        default:
            navigationController.pushViewController(UIHostingController(rootView: Text("Not implemented")), animated: true)
        }
    }

    private func presentChangeImageAlert() {
        let alertView = CustomAlertView(alertImage: "photo",
                                        alertTitle: AppStrings.Settings.changeImageAlertTitle.localized(),
                                        primaryButtonTitle: AppStrings.Settings.uploadImage.localized(),
                                        primaryButtonAction: primaryAction,
                                        closeAction: closeAlert)

        let viewController = UIHostingController(rootView: alertView)
        presentViewControllerAsAlert(viewController: viewController)
    }

    private func presentDeleteAccountAlert() {
        let alertView = CustomAlertView(alertTitle: AppStrings.Settings.deleteAccountAlertTitle.localized(),
                                        alertDescription: AppStrings.Settings.deleteAccountAlertDescription.localized(),
                                        primaryButtonTitle: AppStrings.Settings.deleteAccount.localized(),
                                        type: .danger,
                                        primaryButtonAction: primaryAction,
                                        closeAction: closeAlert)

        let viewController = UIHostingController(rootView: alertView)
        presentViewControllerAsAlert(viewController: viewController)
    }
    
    private func presentChangePassword() {
        let view = ChangePasswordView()
        let hostingController = UIHostingController(rootView: view)
        navigationController.pushViewController(hostingController, animated: true)
    }

    private func presentViewControllerAsAlert(viewController: UIViewController) {
        viewController.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        navigationController.present(viewController, animated: true)
    }

    private func primaryAction() {
        #warning("Implement required primary action")
        print("Hello")
    }

    private func closeAlert() {
        navigationController.dismiss(animated: false, completion: nil)
    }
}

extension ProfileCoordinator: ResultsListViewDelegate {
    func resultsListView(_: ResultsListView, didSelect _: ResultItem) {
        #warning("Implement redirect for every result item")
        let viewController = UIHostingController(rootView: Text("Not implemented yet"))
        navigationController.pushViewController(viewController, animated: true)
    }
}
