import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 45)
                            .stroke(Color.accentColor, lineWidth: 1)
                    )

                Rectangle().frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width) - 12, height: geometry.size.height - 12)
                    .foregroundColor(Color.accentColor)
                    .animation(.linear)
                    .cornerRadius(45.0)
            }
        }
    }
}
