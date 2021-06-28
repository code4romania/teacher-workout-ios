import UIKit

class ViewController: UIViewController {
    #warning("remove this")
    override func viewDidAppear(_: Bool) {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let onboardingViewController = storyboard.instantiateViewController(identifier: OnboardingPageViewController.className) as? OnboardingPageViewController {
            onboardingViewController.modalPresentationStyle = .fullScreen
            present(onboardingViewController, animated: true)
        }
    }
}
