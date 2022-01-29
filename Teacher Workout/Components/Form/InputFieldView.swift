import SwiftUI

struct InputFieldView: View {
    var label: String
    var iconName: String?
    var placeholder: String
    var isSecureField: Bool = false
    var errorMessage: String?

    @Binding var fieldData: String
    @Binding var showError: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(Font.custom("Mulish-ExtraBold", size: 12))
                .foregroundColor(Color.neutral)
                .tracking(1.5)
                .textCase(.uppercase)
            HStack {
                if let iconName = iconName {
                    Image(systemName: iconName)
                        .font(.system(size: 24))
                        .foregroundColor(.secondary)
                }
            
                if isSecureField {
                    SecureField(placeholder, text: $fieldData)
                        .autocapitalization(.none)
                } else {
                    TextField(placeholder, text: $fieldData)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(showError ? Color.red : Color.secondary, lineWidth: 1)
            )

            if let error = errorMessage,
               showError {
                Text(error)
                    .font(Font.custom("Mulish-Regular", size: 16))
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.red)
            }
        }
    }
}

struct InputFieldView_Previews: PreviewProvider {
    @State static var email: String = ""
    @State static var showError = false

    static var previews: some View {
        InputFieldView(label: "EMAIL",
                       iconName: "envelope",
                       placeholder: "name@email.com",
                       errorMessage: "Error",
                       fieldData: $email,
                       showError: $showError)
    }
}
