import SwiftUI

protocol SignInViewDelegate {
    func signInViewDidTapClose(_ view: SignInView)
    func signInViewDidTapSignIn(_ view: SignInView)
    func signInViewDidTapForgotPassword(_ view: SignInView)
}

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    var delegate: SignInViewDelegate

    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                TrailingCloseButton {
                    self.delegate.signInViewDidTapClose(self)
                }

                Text(AppStrings.Authentication.signInIntro.localized())
                    .largeTitleStyle()
                    .padding(.bottom)

                SignInFormView(viewModel: viewModel, delegate: self)

                CustomDividerView(label: AppStrings.dividerLabel.localized(), spacing: 10)
                ProvidersView()
                Spacer()
            }
        }
        .padding(20)
        .navigationBarHidden(true)
    }
}

extension SignInView: SignInFormViewDelegate {
    func signInFormViewDidTapSignIn(_: SignInFormView) {
        delegate.signInViewDidTapSignIn(self)
    }

    func signInFormViewDidTapForgotPassword(_: SignInFormView) {
        delegate.signInViewDidTapForgotPassword(self)
    }
}
