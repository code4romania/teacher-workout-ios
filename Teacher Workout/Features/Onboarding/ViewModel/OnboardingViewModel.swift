import Foundation

class OnboardingViewModel {
    var page: OnboardingPage

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
}
