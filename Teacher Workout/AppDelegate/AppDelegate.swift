import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        customizeAppearance()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    private func customizeAppearance() {
        let accentColor = Color.accent.uiColor

        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().tintColor = accentColor
        UITabBar.appearance().unselectedItemTintColor = Color.secondary.uiColor

        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: accentColor, .font: UIFont(name: "Mulish-Bold", size: 32)!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: accentColor, .font: UIFont(name: "Mulish-SemiBold", size: 18)!]
    }
}
