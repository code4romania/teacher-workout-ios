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
                .foregroundColor(componentColor)
            Rectangle()
                .fill(componentColor)
                .frame(height: 4)
        }
    }

    private var componentColor: Color {
        isSelected ? selectedTextColor : textColor
    }
}
