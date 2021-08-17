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

            Text(AppStrings.ForgotPassword.confirmationIntro.rawValue.localized())
                .largeTitleStyle()
                .padding(.bottom)

            Spacer()
        }.padding(20)
    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
    }
}
