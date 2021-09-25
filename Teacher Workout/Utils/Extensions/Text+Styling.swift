import Foundation
import SwiftUI

extension Text {
    func baseButtonStyle() -> some View {
        font(Font.custom("Mulish-Regular", size: 15))
            .fontWeight(.bold)
            .tracking(1.25)
            .textCase(.uppercase)
            .padding()
            .frame(maxWidth: .infinity)
    }

    func primaryButtonStyle() -> some View {
        baseButtonStyle()
            .foregroundColor(.white)
            .background(Color.accentColor)
            .mask(RoundedRectangle(cornerRadius: 50, style: .continuous))
    }

    func secondaryButtonStyle() -> some View {
        baseButtonStyle()
            .foregroundColor(Color("neutral"))
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color("neutral"), lineWidth: 1)
            )
    }

    func largeTitleStyle() -> Text {
        font(Font.custom("Mulish-Regular", size: 32))
            .fontWeight(.bold)
            .foregroundColor(.accentColor)
    }

    func regularTextStyle() -> some View {
        font(Font.custom("Mulish-Regular", size: 16))
            .foregroundColor(Color("neutral"))
            .lineSpacing(8)
    }

    func largeBoldText() -> Text {
        font(Font.custom("Mulish-Bold", size: 32))
            .fontWeight(.bold)
            .foregroundColor(.accentColor)
    }
}
