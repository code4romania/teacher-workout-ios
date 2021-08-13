import SwiftUI

// MARK: - Dynamic Typing support

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        modifier(ScaledFont(name: name, size: size))
    }
}

// MARK: - Common fonts and sizes

struct BoldLargeFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledFont(name: "Mulish-Bold", size: 20)
    }
}

struct SemiBoldSmallFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledFont(name: "Mulish-SemiBold", size: 12)
    }
}

extension View {
    func boldLargeFont() -> some View {
        modifier(BoldLargeFont())
    }

    func semiBoldSmallFont() -> some View {
        modifier(SemiBoldSmallFont())
    }
}
