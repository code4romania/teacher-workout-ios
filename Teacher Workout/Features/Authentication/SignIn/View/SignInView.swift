import SwiftUI

protocol SignInViewDelegate {
    func signInViewDidTapClose(_ view: SignInView)
    func signInViewDidTapSignIn(_ view: SignInView)
}

struct SignInView: View {
    @ObservedObject var viewModel = SignInViewModel()
    var delegate: SignInViewDelegate

    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                TrailingCloseButton {
                    self.delegate.signInViewDidTapClose(self)
                }

                Text(AppStrings.Authentication.signInIntro.rawValue.localized())
                    .largeTitleStyle()
                    .padding(.bottom)

                SignInFormView(viewModel: viewModel, delegate: self)

                CustomDividerView(label: AppStrings.dividerLabel.rawValue.localized(), spacing: 10)
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
}
