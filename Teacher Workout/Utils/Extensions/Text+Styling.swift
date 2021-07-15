import Foundation
import SwiftUI

extension Text {
    func primaryButtonStyle() -> some View {
        font(Font.custom("Mulish-Regular", size: 15))
            .fontWeight(.bold)
            .tracking(1.25)
            .foregroundColor(.white)
            .textCase(.uppercase)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .mask(RoundedRectangle(cornerRadius: 50, style: .continuous))
    }

    func largeTitleStyle() -> Text {
        font(Font.custom("Mulish-Regular", size: 32))
            .fontWeight(.bold)
            .foregroundColor(.accentColor)
    }
}
