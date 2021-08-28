import SwiftUI

protocol LandingPageViewDelegate {
    func landingPageViewDidTapSignIn(_ view: LandingPageView)
    func landingPageViewDidTapSignUp(_ view: LandingPageView)
}

struct LandingPageView: View {
    var delegate: LandingPageViewDelegate

    var body: some View {
        ZStack {
            Color("emeraldFaded")
                .ignoresSafeArea()

            VStack {
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Logo"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 324)
                Spacer()
                VStack(spacing: 36) {
                    Button(action: {
                        self.delegate.landingPageViewDidTapSignUp(self)
                    }, label: {
                        Text(AppStrings.Authentication.signUpButtonTitle.localized())
                            .primaryButtonStyle()
                    })

                    ExistingAccountFooterView(delegate: self)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 54)
        }
        .navigationBarHidden(true)
    }
}

extension LandingPageView: ExistingAccountFooterViewDelegate {
    func existingAccountFooterViewDidTapSignIn(_: ExistingAccountFooterView) {
        delegate.landingPageViewDidTapSignIn(self)
    }
}
