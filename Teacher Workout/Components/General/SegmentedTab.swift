import SwiftUI

struct PickerTab: View {
    var isSelected: Bool
    var title: String
    var textColor: Color = .secondary
    var selectedTextColor: Color = .accentColor

    var body: some View {
        VStack {
            Text(title)
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity)
                .foregroundColor(isSelected ? selectedTextColor : textColor)
            Rectangle()
                .fill(isSelected ? selectedTextColor : textColor)
                .frame(height: 4)
        }
    }
}
