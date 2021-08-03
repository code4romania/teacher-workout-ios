import SwiftUI

struct ListHeaderView: View {
    var label: String

    var body: some View {
        HStack {
            Text(label)
                .font(Font.custom("Mulish-Bold", size: 20))
                .padding(16)
                .foregroundColor(Color("cyan"))
            Spacer()
        }
    }
}
