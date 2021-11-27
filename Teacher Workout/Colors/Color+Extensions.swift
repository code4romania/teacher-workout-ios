import Foundation
import SwiftUI

extension Color {
    static var accent: Color {
        return Color("AccentColor")
    }
    
    static var cyanTheme: Color {
        return Color("cyan")
    }
    
    static var danger: Color {
        return Color("danger")
    }
    
    static var emeraldFaded: Color {
        return Color("emeraldFaded")
    }
    
    static var neutral: Color {
        return Color("neutral")
    }
    
    static var secondary: Color {
        return Color("secondaryColor")
    }
    
    static var background: Color {
        return Color("backgroundColor")
    }
    
    var uiColor: UIColor {
        return UIColor(self)
    }
    
    var cgColor: CGColor {
        return uiColor.cgColor
    }
}
