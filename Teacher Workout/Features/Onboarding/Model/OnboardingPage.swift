import Foundation

struct OnboardingPage {
    var title: String
    var description: String
    var image: String

    static let mockedData: [OnboardingPage] = [
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
}
