import SwiftUI
protocol ThemesGridDelegate {
    func themesGrid(_ view: ThemesGrid, didSelectTheme theme: Theme)
}

struct ThemesGrid: View {
    var themes: [Theme]
    var delegate: ThemesGridDelegate?

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
            ForEach(themes) { theme in
                ThemeItemCell(item: theme)
                    .frame(maxHeight: 57)
                    .onTapGesture {
                        self.delegate?.themesGrid(self, didSelectTheme: theme)
                    }
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
