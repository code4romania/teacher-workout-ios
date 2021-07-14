import SwiftUI

struct InputFieldView: View {
    var label: String
    var iconName: String
    var placeholder: String
    var isSecureField: Bool = false

    @Binding var fieldData: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption)
                .textCase(.uppercase)
            HStack {
                Image(systemName: iconName)
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)

                if isSecureField {
                    SecureField(placeholder, text: $fieldData)
                } else {
                    TextField(placeholder, text: $fieldData)
                        .keyboardType(.emailAddress)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color.secondary, lineWidth: 1)
            )
        }
    }
}

struct InputFieldView_Previews: PreviewProvider {
    @State static var email: String = ""

    static var previews: some View {
        InputFieldView(label: "EMAIL",
                       iconName: "envelope",
                       placeholder: "name@email.com",
                       fieldData: $email)
    }
}
