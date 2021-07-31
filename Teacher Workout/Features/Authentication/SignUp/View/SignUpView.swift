import SwiftUI

protocol SignUpViewDelegate {
    func signUpViewDidTapClose(_ view: SignUpView)
}

struct SignUpView: View {
    var delegate: SignUpViewDelegate

    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                TrailingCloseButton {
                    self.delegate.signUpViewDidTapClose(self)
                }

                Text(AppStrings.Authentication.signInIntro.rawValue.localized())
                    .largeTitleStyle()
                    .padding(.bottom)

                CustomDividerView(label: AppStrings.dividerLabel.rawValue.localized(), spacing: 10)
                ProvidersView()
                    .padding(.bottom, 20)
                Spacer()
                ExistingAccountFooterView(delegate: self)
            }
        }
        .padding(20)
        .navigationBarHidden(true)
    }
}

extension SignUpView: ExistingAccountFooterViewDelegate {
    func existingAccountFooterViewDidTapSignIn(_: ExistingAccountFooterView) {
        print("i have account")
    }
}

struct SignUpView_Previews: PreviewProvider, SignUpViewDelegate {
    static var previews: some View {
        SignUpView(delegate: self as! SignUpViewDelegate)
    }

    func signUpViewDidTapClose(_: SignUpView) {
        print("Close view")
    }
}
