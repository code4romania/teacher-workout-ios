import Foundation

class ResetPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var showEmailError: Bool = false

    private let validator = Validator.shared

    func isValidEmail() -> Bool {
        let validationState = validator.isValidData(data: email, type: .email)
        showEmailError = !validationState
        return validationState
    }
}
