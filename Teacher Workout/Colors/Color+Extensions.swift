import Foundation
import SwiftUI

extension Color {
    static var accent: Color {
        Color("AccentColor")
    }

    static var cyanTheme: Color {
        Color("cyan")
    }

    static var danger: Color {
        Color("danger")
    }

    static var emeraldFaded: Color {
        Color("emeraldFaded")
    }

    static var neutral: Color {
        Color("neutral")
    }

    static var secondary: Color {
        Color("secondaryColor")
    }

    static var background: Color {
        Color("backgroundColor")
    }

    var uiColor: UIColor {
        UIColor(self)
    }

    var cgColor: CGColor {
        uiColor.cgColor
    }
}
