import SwiftUI

protocol ExistingAccountFooterViewDelegate {
    func existingAccountFooterViewDidTapSignIn(_ view: ExistingAccountFooterView)
}

struct ExistingAccountFooterView: View {
    var delegate: ExistingAccountFooterViewDelegate

    var body: some View {
        HStack(spacing: 10) {
            Text(AppStrings.Authentication.alreadyHaveAccountLabel.localized())
                .font(Font.custom("Mulish-SemiBold", size: 16))
                .foregroundColor(.gray)

            Button(action: {
                self.delegate.existingAccountFooterViewDidTapSignIn(self)
            }, label: {
                Text(AppStrings.Authentication.signInButtonTitle.localized())
                    .font(Font.custom("Mulish-Bold", size: 16))
            })
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
