import UIKit

class OnboardingPageViewController: UIPageViewController {
    let pages = [
        OnboardingPage(title: "Onboarding 1",
                       description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit adipiscing sit enim enim id iaculis tristique.",
                       image: "onboarding_one"),
        OnboardingPage(title: "Onboarding 2",
                       description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit adipiscing sit enim enim id iaculis tristique.",
                       image: "onboarding_two"),
        OnboardingPage(title: "Onboarding 3",
                       description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit adipiscing sit enim enim id iaculis tristique.",
                       image: "onboarding_three"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
    }

    func setupDataSource() {
        dataSource = self

        if let startingViewController = instantiateOnboardingViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    func instantiateOnboardingViewController(at index: Int) -> OnboardingViewController? {
        guard index >= 0,
              index < pages.count
        else {
            return nil
        }

        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let onboardingPageViewController = storyboard.instantiateViewController(identifier: OnboardingViewController.className) as? OnboardingViewController {
            let viewModel = OnboardingViewModel(page: pages[index])
            onboardingPageViewController.index = index
            onboardingPageViewController.viewModel = viewModel
            return onboardingPageViewController
        }

        return nil
    }
}

// MARK: - Data Source

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingViewController).index
        index -= 1
        return instantiateOnboardingViewController(at: index)
    }

    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingViewController).index
        index += 1
        return instantiateOnboardingViewController(at: index)
    }
}
