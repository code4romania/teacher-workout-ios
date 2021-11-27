import SwiftUI

struct CheckboxFieldView<Content: View>: View {
    @Binding var isSelected: Bool
    var content: () -> Content

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .frame(maxWidth: 16, maxHeight: 16)
                .foregroundColor(isSelected ? Color.accent : .gray)
            content()
        }
        .padding(.horizontal, 4)
        .onTapGesture {
            isSelected.toggle()
        }
    }
}
