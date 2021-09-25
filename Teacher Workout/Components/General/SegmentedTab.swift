import SwiftUI

struct PickerTab: View {
    var isSelected: Bool
    var title: String
    var textColor: Color = .secondary
    var selectedTextColor: Color = .accentColor

    var body: some View {
        Text(title)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(isSelected ? selectedTextColor : textColor)
    }
}
