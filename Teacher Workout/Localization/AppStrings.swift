import Foundation

protocol Localizable: RawRepresentable {
    func localized() -> String
}

extension Localizable {
    func localized() -> String {
        if let string = rawValue as? String {
            return string.localized()
        }

        return ""
    }
}

extension String {
    func localized(bundle _: Bundle = .main, tableName: String = "Localizable") -> String {
        NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}

enum AppStrings: String, Localizable {
    case dummy = ""
    case dividerLabel

    enum Menu: String, Localizable {
        case home = "Menu.home"
        case discover = "Menu.discover"
        case profile = "Menu.profile"
    }

    enum Onboarding: String, Localizable {
        case nextButton = "Onboarding.nextButton"
        case doneButton = "Onboarding.doneButton"
    }

    enum Authentication: String, Localizable {
        case signInIntro = "Authentication.signInIntro"
        case signUpIntro = "Authentication.signUpIntro"
        case signInForgotPasswordLabel = "Authentication.signInForgotPasswordLabel"
        case signInButtonTitle = "Authentication.signInButtonTitle"
        case signUpButtonTitle = "Authentication.signUpButtonTitle"
        case alreadyHaveAccountLabel = "Authentication.alreadyHaveAccountLabel"
        case termsAndConditionsLabel = "Authentication.termsAndConditionsLabel"

        enum Email: String, Localizable {
            case inputLabel = "Authentication.Email.inputLabel"
            case inputPlaceholder = "Authentication.Email.inputPlaceholder"
            case invalidEmailMessage = "Authentication.Email.invalidEmailMessage"
        }

        enum Password: String, Localizable {
            case inputLabel = "Authentication.Password.inputLabel"
            case inputConfirmLabel = "Authentication.Password.inputConfirmLabel"
            case inputPlaceholder = "Authentication.Password.inputPlaceholder"
            case invalidMessage = "Authentication.Password.invalidMessage"
        }
    }

    enum ForgotPassword: String, Localizable {
        case forgotIntro = "ForgotPassword.forgotIntro"
        case resetButtonTitle = "ForgotPassword.resetButtonTitle"
        case confirmationIntro = "ForgotPassword.confirmationIntro"
        case confirmationDetails = "ForgotPassword.confirmationDetails"
    }

    enum Discover: String, Localizable {
        case navigationTitle = "Discover.navigationTitle"
        case listDescription = "Discover.listDescription"
    }

    enum Search: String, Localizable {
        case placeholder = "Search.placeholder"
        case cancelButton = "Search.cancelButton"
    }

    enum Home: String, Localizable {
        case navigationTitle = "Home.navigationTitle"
        case lessonsInProgress = "Home.lessonsInProgress"
        case newLessons = "Home.newLessons"
    }

    enum Lesson: String, Localizable {
        case continueText = "Lesson.continueText"

        enum Intro: String, Localizable {
            case startLesson = "Lesson.Intro.startLesson"
            case saveLesson = "Lesson.Intro.saveLesson"
        }

        enum Finished: String, Localizable {
            case titleText = "Lesson.Finished.titleText"
            case subtitleText = "Lesson.Finished.subtitleText"
            case share = "Lesson.Finished.share"
        }
    }

    enum Profile: String, Localizable {
        case resultsTabLabel = "Profile.resultsTabLabel"
        case settingsTabLabel = "Profile.settingsTabLabel"
    }

    enum Settings: String, Localizable {
        case changeImage = "Settings.changeImage"
        case changePassword = "Settings.changePassword"
        case notifications = "Settings.notifications"
        case logOut = "Settings.logOut"
        case deleteAccount = "Settings.deleteAccount"
    }
}
