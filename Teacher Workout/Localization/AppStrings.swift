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
        case signInForgotPasswordLabel = "Authentication.signInForgotPasswordLabel"
        case signInButtonTitle = "Authentication.signInButtonTitle"
        case signUpButtonTitle = "Authentication.signUpButtonTitle"
        case alreadyHaveAccountLabel = "Authentication.alreadyHaveAccountLabel"

        enum Email: String, Localizable {
            case inputLabel = "Authentication.Email.inputLabel"
            case inputPlaceholder = "Authentication.Email.inputPlaceholder"
            case invalidEmailMessage = "Authentication.Email.invalidEmailMessage"
        }

        enum Password: String, Localizable {
            case inputLabel = "Authentication.Password.inputLabel"
            case inputPlaceholder = "Authentication.Password.inputPlaceholder"
        }
    }
}
