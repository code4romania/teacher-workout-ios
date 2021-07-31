import SwiftUI

struct CheckboxFieldView: View {
    @Binding var isSelected: Bool
    var content: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .frame(maxWidth: 16, maxHeight: 16)
                .foregroundColor(isSelected ? .accentColor : .gray)

            // TODO: Add link to terms and conditions
            Text(content)
        }
        .padding(.horizontal, 4)
        .onTapGesture {
            isSelected.toggle()
        }
    }
}
