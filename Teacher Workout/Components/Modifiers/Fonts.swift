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
            .scaledFont(name: "Mulish-Bold", size: 26)
    }
}

struct SemiBoldSmallFont: ViewModifier {
    var size: CGFloat

    func body(content: Content) -> some View {
        content
            .scaledFont(name: "Mulish-SemiBold", size: size)
    }
}

extension View {
    func boldLargeFont() -> some View {
        modifier(BoldLargeFont())
    }

    func semiBoldSmallFont(size: CGFloat = 12) -> some View {
        modifier(SemiBoldSmallFont(size: size))
    }
}
