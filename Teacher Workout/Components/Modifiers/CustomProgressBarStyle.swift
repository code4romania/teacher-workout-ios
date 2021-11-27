import Foundation
import SwiftUI

struct CustomProgressBarStyle: ProgressViewStyle {
    var width: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.white)
                .frame(width: width, height: 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.accent, lineWidth: 1)
                )

            RoundedRectangle(cornerRadius: 4)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * width, height: 8)
                .foregroundColor(Color.accent)
        }
    }
}
