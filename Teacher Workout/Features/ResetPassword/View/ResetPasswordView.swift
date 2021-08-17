import SwiftUI

protocol ResetPasswordViewDelegate {
    func resetPasswordViewDidTapClose(_ view: ResetPasswordView)
}

struct ResetPasswordView: View {
    var delegate: ResetPasswordViewDelegate?

    var body: some View {
        VStack(alignment: .leading) {
            TrailingCloseButton {
                self.delegate?.resetPasswordViewDidTapClose(self)
            }

            Text(AppStrings.ForgotPassword.forgotIntro.rawValue.localized())
                .largeTitleStyle()
                .padding(.bottom)

            Spacer()
        }.padding(20)
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
