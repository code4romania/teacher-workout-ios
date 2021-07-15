import SwiftUI

struct LandingPageView: View {
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
                        // TODO: Implement sign up action
                    }, label: {
                        Text(AppStrings.Authentication.signUpButtonTitle.rawValue.localized())
                            .primaryButtonStyle()
                    })

                    ExistingAccountFooterView()
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 54)
        }
        .navigationBarHidden(true)
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
