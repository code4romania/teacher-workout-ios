import SwiftUI

struct SignInFormView: View {
    @Binding var email: String
    @Binding var password: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            InputFieldView(label: AppStrings.Authentication.Email.inputLabel.rawValue.localized(),
                           iconName: "envelope",
                           placeholder: AppStrings.Authentication.Email.inputPlaceholder.rawValue.localized(),
                           fieldData: $email)

            InputFieldView(label: AppStrings.Authentication.Password.inputLabel.rawValue.localized(),
                           iconName: "lock",
                           placeholder: AppStrings.Authentication.Password.inputPlaceholder.rawValue.localized(),
                           isSecureField: true,
                           fieldData: $password)

            Button(action: {
                print("Forgot password")
            }, label: {
                VStack {
                    Text(AppStrings.Authentication.signInForgotPasswordLabel.rawValue.localized())
                        .font(Font.custom("Mulish-Bold", size: 16))
                        .foregroundColor(.accentColor)
                }

            })

            Button(action: {
                print("signing in")
            }, label: {
                Text(AppStrings.Authentication.signInButtonTitle.rawValue.localized())
                    .primaryButtonStyle()
            })
        }
    }
}

struct SignInFormView_Previews: PreviewProvider {
    @State static var email: String = ""
    @State static var password: String = ""

    static var previews: some View {
        SignInFormView(email: $email, password: $password)
    }
}
