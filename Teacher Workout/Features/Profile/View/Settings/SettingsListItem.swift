import SwiftUI

struct SettingsListItem: View {
    var title: String

    var body: some View {
        HStack {
            Text(title)
                .modifier(SemiBoldSmallFont(size: 16))
            Spacer()
            Image(systemName: "chevron.right")
        }.background(Color("backgroundColor"))
            .padding(.vertical, 10)
            .foregroundColor(Color("neutral"))
    }
}
