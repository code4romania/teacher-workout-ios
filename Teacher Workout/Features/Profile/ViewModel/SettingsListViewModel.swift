import Foundation

enum SettingsListOption: String {
    case changeImage
    case changePassword
    case deleteAccount
    case logOut
    case notifications

    var titleValue: String {
        switch self {
        case .changeImage:
            return AppStrings.Settings.changeImage.localized()
        case .changePassword:
            return AppStrings.Settings.changePassword.localized()
        case .deleteAccount:
            return AppStrings.Settings.deleteAccount.localized()
        case .logOut:
            return AppStrings.Settings.logOut.localized()
        case .notifications:
            return AppStrings.Settings.notifications.localized()
        }
    }
}

class SettingsListViewModel {
    var availableActions: [SettingsListOption] {
        [.changeImage, .changePassword, .notifications, .logOut, .deleteAccount]
    }
}
