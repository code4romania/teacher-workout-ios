import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                TrailingCloseButton {
                    print("Closing sign in")
                }

                Text(AppStrings.Authentication.signInIntro.rawValue.localized())
                    .largeTitleStyle()
                    .padding(.bottom)

                SignInFormView(email: $email, password: $password)

                CustomDividerView(label: AppStrings.dividerLabel.rawValue.localized(), spacing: 10)
                ProvidersView()
                Spacer()
            }
        }
        .padding(20)
        .navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
