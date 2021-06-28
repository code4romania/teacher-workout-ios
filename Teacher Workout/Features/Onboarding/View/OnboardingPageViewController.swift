import UIKit

class OnboardingPageViewController: UIPageViewController, OnboardingViewControllerDelegate {
    let pages = OnboardingPage.mockedData
    var currentIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
    }

    func setupDataSource() {
        dataSource = self

        if let startingViewController = instantiateOnboardingViewController(at: currentIndex) {
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
            onboardingPageViewController.currentPageIndex = index
            onboardingPageViewController.viewModel = viewModel
            onboardingPageViewController.delegate = self
            return onboardingPageViewController
        }

        return nil
    }

    // MARK: - OnboardingViewControllerDelegate

    func onboardingViewController(_ viewController: OnboardingViewController, didSelectPageIndex index: Int) {
        if let viewController = instantiateOnboardingViewController(at: index) {
            setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
        }
    }

    func onboardingViewControllerDidSkip(_: OnboardingViewController) {
        dismiss(animated: true, completion: nil)
    }

    func onboardingViewControllerDidPressNext(_: OnboardingViewController, currentIndex index: Int) {
        let nextIndex = index + 1

        guard nextIndex < pages.count else {
            dismiss(animated: true, completion: nil)
            return
        }

        if let nextViewController = instantiateOnboardingViewController(at: nextIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

// MARK: - Data Source

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        currentIndex = (viewController as! OnboardingViewController).currentPageIndex
        currentIndex -= 1
        return instantiateOnboardingViewController(at: currentIndex)
    }

    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        currentIndex = (viewController as! OnboardingViewController).currentPageIndex
        currentIndex += 1
        if currentIndex >= pages.count {
            dismiss(animated: true, completion: nil)
            return nil
        }
        return instantiateOnboardingViewController(at: currentIndex)
    }
}
