import Foundation
import SwiftUI

extension Text {
    func baseButtonStyle() -> some View {
        font(Font.custom("Mulish-Regular", size: 15))
            .fontWeight(.bold)
            .tracking(1.25)
            .foregroundColor(.white)
            .textCase(.uppercase)
            .padding()
            .frame(maxWidth: .infinity)
    }

    func primaryButtonStyle() -> some View {
        baseButtonStyle()
            .background(Color.accentColor)
            .mask(RoundedRectangle(cornerRadius: 50, style: .continuous))
    }

    func secondaryButtonStyle() -> some View {
        baseButtonStyle()
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.accentColor, lineWidth: 1)
            )
    }

    func largeTitleStyle() -> Text {
        font(Font.custom("Mulish-Regular", size: 32))
            .fontWeight(.bold)
            .foregroundColor(.accentColor)
    }
}
