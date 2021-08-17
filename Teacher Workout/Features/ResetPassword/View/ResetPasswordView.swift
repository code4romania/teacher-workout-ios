import SwiftUI

protocol ResetPasswordViewDelegate {
    func resetPasswordViewDidTapClose(_ view: ResetPasswordView)
    func resetPasswordViewDidTapReset(_ view: ResetPasswordView, for email: String)
}

struct ResetPasswordView: View {
    @ObservedObject var viewModel = ResetPasswordViewModel()

    var delegate: ResetPasswordViewDelegate?

    var body: some View {
        VStack(alignment: .leading) {
            TrailingCloseButton {
                self.delegate?.resetPasswordViewDidTapClose(self)
            }

            Text(AppStrings.ForgotPassword.forgotIntro.rawValue.localized())
                .largeTitleStyle()
                .padding(.bottom)

            VStack(alignment: .leading, spacing: 30) {
                InputFieldView(label: AppStrings.Authentication.Email.inputLabel.rawValue.localized(),
                               iconName: "envelope",
                               placeholder: AppStrings.Authentication.Email.inputPlaceholder.rawValue.localized(),
                               errorMessage: AppStrings.Authentication.Email.invalidEmailMessage.rawValue.localized(),
                               fieldData: $viewModel.email,
                               showError: $viewModel.showEmailError)

                Button(action: {
                    guard viewModel.isValidEmail() else {
                        return
                    }

                    self.delegate?.resetPasswordViewDidTapReset(self, for: viewModel.email)
                }, label: {
                    Text(AppStrings.ForgotPassword.resetButtonTitle.rawValue.localized())
                        .primaryButtonStyle()
                })
            }

            Spacer()
        }.padding(20)
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
