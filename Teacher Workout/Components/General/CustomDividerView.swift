import SwiftUI

struct CustomDividerView: View {
    var label: String
    var spacing: CGFloat

    var body: some View {
        VStack {
            Spacer(minLength: spacing)

            HStack {
                Rectangle().fill(Color.gray.opacity(0.5)).frame(maxWidth: .infinity, maxHeight: 1)
                Text(label)
                    .font(Font.custom("Mulish-Regular", size: 14))
                    .foregroundColor(.gray)
                Rectangle().fill(Color.gray.opacity(0.5)).frame(maxWidth: .infinity, maxHeight: 1)
            }

            Spacer(minLength: spacing)
        }
    }
}

struct CustomDividerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDividerView(label: "sau", spacing: 10)
    }
}
