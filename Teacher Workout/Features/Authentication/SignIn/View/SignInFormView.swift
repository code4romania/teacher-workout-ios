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

            Button(action: {
                self.delegate.signInFormViewDidTapForgotPassword(self)
            }, label: {
                VStack {
                    Text(AppStrings.Authentication.signInForgotPasswordLabel.localized())
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
                Text(AppStrings.Authentication.signInButtonTitle.localized())
                    .primaryButtonStyle()
            })
        }
    }
}
