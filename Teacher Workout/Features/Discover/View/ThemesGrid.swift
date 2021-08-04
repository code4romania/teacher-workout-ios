import SwiftUI

struct ThemesGrid: View {
    var themes: [Theme]

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
            ForEach(themes) { theme in
                ThemeItemCell(item: theme)
                    .frame(maxHeight: 57)
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
