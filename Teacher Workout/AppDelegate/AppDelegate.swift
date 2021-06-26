import UIKit

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
        let accentColor = UIColor(named: "AccentColor")!

        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().tintColor = accentColor
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "secondaryColor")

        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: accentColor]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: accentColor]
    }
}
