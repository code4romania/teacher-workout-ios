import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel = SignInViewModel()

    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                TrailingCloseButton {
                    // TODO: add the logic in the coordinator when closing the sign in view to show the onboarding flow
                }

                Text(AppStrings.Authentication.signInIntro.rawValue.localized())
                    .largeTitleStyle()
                    .padding(.bottom)

                SignInFormView(viewModel: viewModel)

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
