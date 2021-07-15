import SwiftUI

struct ExistingAccountFooterView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text(AppStrings.Authentication.alreadyHaveAccountLabel.rawValue.localized())
                .font(Font.custom("Mulish-SemiBold", size: 16))
                .foregroundColor(.gray)

            Button(action: {
                // TODO: Implement sign in action
            }, label: {
                Text(AppStrings.Authentication.signInButtonTitle.rawValue.localized())
                    .font(Font.custom("Mulish-Bold", size: 16))
            })
        }
    }
}

struct ExistingAccountFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ExistingAccountFooterView()
    }
}
