import Foundation

class SignUpFormViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showEmailError: Bool = false
    @Published var showPasswordError: Bool = false
    @Published var showConfirmPasswordError: Bool = false
    @Published var areTermsAndConditionsAccepted: Bool = false

    private let validator = Validator.shared

    func isValidEmail() -> Bool {
        let validationState = validator.isValidData(data: email, type: .email)
        showEmailError = !validationState
        return validationState
    }

    func isValidPassword() -> Bool {
        let validationState = validator.isValidData(data: password, type: .password)
        showPasswordError = !validationState
        return validationState
    }

    // TODO: Validate confirm password
}
