import SwiftUI

struct ChangePasswordView: View {
    var primaryButtonAction: () -> Void
    var closeAction: () -> Void

    @StateObject var viewModel = ChangePasswordViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                ProfileHeaderView(width: geometry.size.width)

                Spacer()

                Text(AppStrings.ChangePassword.sectionLabel.localized())
                    .font(Font.custom("Mulish-Bold", size: 20))
                    .padding(16)
                    .foregroundColor(Color.neutral)
                    .padding(.bottom, 16)

                VStack(spacing: 16) {
                    InputFieldView(label: AppStrings.ChangePassword.newPasswordLabel.localized(),
                                   placeholder: AppStrings.Authentication.Password.inputPlaceholder.localized(),
                                   isSecureField: true,
                                   errorMessage: AppStrings.Authentication.Password.invalidMessage.localized(),
                                   fieldData: $viewModel.password,
                                   showError: $viewModel.showPasswordError)

                    InputFieldView(label: AppStrings.ChangePassword.confirmPasswordLabel.localized(),
                                   placeholder: AppStrings.Authentication.Password.inputPlaceholder.localized(),
                                   isSecureField: true, errorMessage: AppStrings.ChangePassword.confirmPasswordError.localized(),
                                   fieldData: $viewModel.confirmPassword,
                                   showError: $viewModel.showConfirmPasswordError)
                }.padding(.horizontal, 16)
                    .padding(.bottom, 16)

                Spacer()

                Group {
                    Button(action: {
                        guard viewModel.isValidPassword() else {
                            return
                        }

                        self.primaryButtonAction()
                    }) {
                        Text(AppStrings.ChangePassword.ctaButtonTitle.localized())
                            .primaryButtonStyle()
                    }.padding(.bottom, 16)

                    Button(action: self.closeAction) {
                        Text(AppStrings.cancel.localized())
                            .boldLargeFont(size: 15)
                            .foregroundColor(.red)
                            .padding(8)
                    }.padding(.bottom, 16)
                        .frame(maxWidth: .infinity, alignment: .center)

                }.padding(.horizontal, 16)

                Spacer()
            }
        }
        .navigationTitle(Text(AppStrings.ChangePassword.navigationTitle.localized()))
    }
}
