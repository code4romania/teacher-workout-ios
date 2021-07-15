import SwiftUI

struct SignInFormView: View {
    @ObservedObject var viewModel: SignInViewModel

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
                print("Forgot password")
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

                print("signing in with \(viewModel.email) and password \(viewModel.password)")

            }, label: {
                Text(AppStrings.Authentication.signInButtonTitle.rawValue.localized())
                    .primaryButtonStyle()
            })
        }
    }
}

struct SignInFormView_Previews: PreviewProvider {
    @StateObject static var viewModel = SignInViewModel()

    static var previews: some View {
        SignInFormView(viewModel: viewModel)
    }
}
