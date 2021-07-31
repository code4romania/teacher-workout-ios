import SwiftUI

protocol SignUpViewDelegate {
    func signUpViewDidTapClose(_ view: SignUpView)
    func signUpViewDidTapHaveAccount(_ view: SignUpView)
}

struct SignUpView: View {
    var delegate: SignUpViewDelegate

    var body: some View {
        GeometryReader { _ in
            VStack {
                TrailingCloseButton {
                    self.delegate.signUpViewDidTapClose(self)
                }
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text(AppStrings.Authentication.signUpIntro.localized())
                            .largeTitleStyle()
                            .padding(.bottom)

                        SignUpFormView()

                        CustomDividerView(label: AppStrings.dividerLabel.rawValue.localized(), spacing: 10)
                        ProvidersView()
                            .padding(.bottom, 20)
                    }
                }
            }
        }
        .padding(20)
        .ignoresSafeArea(.container, edges: .bottom)
        .navigationBarHidden(true)
    }
}

extension SignUpView: ExistingAccountFooterViewDelegate {
    func existingAccountFooterViewDidTapSignIn(_: ExistingAccountFooterView) {
        delegate.signUpViewDidTapHaveAccount(self)
    }
}
