import SwiftUI

struct SignUpFormView: View {
    @StateObject var viewModel = SignUpFormViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            InputFieldView(label: AppStrings.Authentication.Email.inputLabel.rawValue.localized(),
                           iconName: "envelope",
                           placeholder: AppStrings.Authentication.Email.inputPlaceholder.rawValue.localized(),
                           errorMessage: AppStrings.Authentication.Email.invalidEmailMessage.rawValue.localized(),
                           fieldData: $viewModel.email,
                           showError: $viewModel.showEmailError)

            InputFieldView(label: AppStrings.Authentication.Password.inputLabel.rawValue.localized(),
                           iconName: "lock",
                           placeholder: AppStrings.Authentication.Password.inputPlaceholder.rawValue.localized(),
                           isSecureField: true,
                           fieldData: $viewModel.password,
                           showError: $viewModel.showPasswordError)

            InputFieldView(label: AppStrings.Authentication.Password.inputConfirmLabel.localized(),
                           iconName: "lock",
                           placeholder: AppStrings.Authentication.Password.inputPlaceholder.rawValue.localized(),
                           isSecureField: true,
                           fieldData: $viewModel.confirmPassword,
                           showError: $viewModel.showConfirmPasswordError)

            CheckboxFieldView(isSelected: $viewModel.areTermsAndConditionsAccepted,
                              content: AppStrings.Authentication.termsAndConditionsLabel.localized())

            Button(action: {
                guard viewModel.isValidEmail(),
                      viewModel.isValidPassword()
                else {
                    return
                }

                // TODO: Implement sign up action

            }, label: {
                Text(AppStrings.Authentication.signUpButtonTitle.localized())
                    .primaryButtonStyle()
            })
        }
    }
}
