import Foundation

class OnboardingViewModel {
    var page: OnboardingPage
    var isLastPage: Bool = false

    init(page: OnboardingPage) {
        self.page = page
    }

    var pageImage: String {
        page.image
    }

    var pageTitle: String {
        page.title
    }

    var pageDescription: String {
        page.description
    }

    var onboardingButtonTitle: String {
        let title = isLastPage ? AppStrings.Onboarding.doneButton.localized() : AppStrings.Onboarding.nextButton.localized()
        return title.uppercased()
    }
}
