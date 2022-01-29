import Foundation

final class ChangePasswordViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showPasswordError: Bool = false
    @Published var showConfirmPasswordError: Bool = false

    private let validator = Validator.shared

    func isValidPassword() -> Bool {
        let isValidPassword = validator.isValidData(data: password, type: .password)
        let areSamePasswords = validator.isSameData(first: password, second: confirmPassword)

        showPasswordError = !isValidPassword
        showConfirmPasswordError = !areSamePasswords
        return isValidPassword && areSamePasswords
    }
}

