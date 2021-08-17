import SwiftUI

protocol SignInFormViewDelegate {
    func signInFormViewDidTapSignIn(_ view: SignInFormView)
    func signInFormViewDidTapForgotPassword(_ view: SignInFormView)
}

struct SignInFormView: View {
    @ObservedObject var viewModel: SignInViewModel
    var delegate: SignInFormViewDelegate

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

            Button(action: {
                self.delegate.signInFormViewDidTapForgotPassword(self)
            }, label: {
                VStack {
                    Text(AppStrings.Authentication.signInForgotPasswordLabel.rawValue.localized())
                        .font(Font.custom("Mulish-Bold", size: 16))
                        .foregroundColor(.accentColor)
                }
            })

            Button(action: {
                guard viewModel.isValidEmail(),
                      viewModel.isValidPassword()
                else {
                    return
                }

                // TODO: Implement sign in action
                self.delegate.signInFormViewDidTapSignIn(self)
            }, label: {
                Text(AppStrings.Authentication.signInButtonTitle.rawValue.localized())
                    .primaryButtonStyle()
            })
        }
    }
}
