import Foundation

class OnboardingViewModel {
    var page: OnboardingPage

    init(page: OnboardingPage) {
        self.page = page
    }

    var pageImage: String {
        return page.image
    }

    var pageTitle: String {
        return page.title
    }

    var pageDescription: String {
        return page.description
    }
}
