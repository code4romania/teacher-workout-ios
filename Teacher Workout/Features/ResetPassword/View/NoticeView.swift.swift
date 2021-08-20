import SwiftUI

protocol NoticeViewDelegate {
    func noticeViewDidTapClose(_ view: NoticeView)
}

struct NoticeView: View {
    var delegate: NoticeViewDelegate?

    var body: some View {
        VStack(alignment: .leading) {
            TrailingCloseButton {
                self.delegate?.noticeViewDidTapClose(self)
            }

            Text(AppStrings.ForgotPassword.confirmationIntro.localized())
                .largeTitleStyle()
                .padding(.bottom, 30)

            Image(systemName: "envelope.fill")
                .font(.system(size: 48))
                .foregroundColor(.accentColor)
                .padding(.bottom, 26)

            Text(AppStrings.ForgotPassword.confirmationDetails.localized())
                .regularTextStyle()

            Spacer()
        }.padding(20)
    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
    }
}
