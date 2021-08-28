import SwiftUI

protocol SignUpFormViewDelegate {
    func signUpFormViewDidTapSignUp(_ view: SignUpFormView)
}

struct SignUpFormView: View {
    @StateObject var viewModel = SignUpFormViewModel()
    var delegate: SignUpFormViewDelegate

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            InputFieldView(label: AppStrings.Authentication.Email.inputLabel.localized(),
                           iconName: "envelope",
                           placeholder: AppStrings.Authentication.Email.inputPlaceholder.localized(),
                           errorMessage: AppStrings.Authentication.Email.invalidEmailMessage.localized(),
                           fieldData: $viewModel.email,
                           showError: $viewModel.showEmailError)

            InputFieldView(label: AppStrings.Authentication.Password.inputLabel.localized(),
                           iconName: "lock",
                           placeholder: AppStrings.Authentication.Password.inputPlaceholder.localized(),
                           isSecureField: true,
                           errorMessage: AppStrings.Authentication.Password.invalidMessage.localized(),
                           fieldData: $viewModel.password,
                           showError: $viewModel.showPasswordError)

            InputFieldView(label: AppStrings.Authentication.Password.inputConfirmLabel.localized(),
                           iconName: "lock",
                           placeholder: AppStrings.Authentication.Password.inputPlaceholder.localized(),
                           isSecureField: true,
                           fieldData: $viewModel.confirmPassword,
                           showError: $viewModel.showConfirmPasswordError)

            CheckboxFieldView(isSelected: $viewModel.areTermsAndConditionsAccepted) {
                // TODO: Add link to terms and conditions
                Text(AppStrings.Authentication.termsAndConditionsLabel.localized())
                    .fixedSize(horizontal: false, vertical: true)
            }

            Button(action: {
                guard viewModel.isValidEmail(),
                      viewModel.isValidPassword(),
                      viewModel.areTermsAndConditionsAccepted
                else {
                    return
                }

                // TODO: Implement sign up action
                self.delegate.signUpFormViewDidTapSignUp(self)

            }, label: {
                Text(AppStrings.Authentication.signUpButtonTitle.localized())
                    .primaryButtonStyle()
            })
        }
    }
}
