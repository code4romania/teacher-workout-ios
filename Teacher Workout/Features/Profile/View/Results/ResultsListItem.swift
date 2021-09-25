import SwiftUI

struct ResultsListItem: View {
    let item: ResultItem

    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .modifier(BoldLargeFont(size: 20))
                        .foregroundColor(.accentColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.progress)
                        .modifier(SemiBoldSmallFont(size: 16))
                        .foregroundColor(.secondary)
                    ProgressView(value: item.progressValue, total: 100)
                        .progressViewStyle(CustomProgressBarStyle(width: geometry.size.width - 20))
                        .padding(.top, 4)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
        }.background(Color("backgroundColor"))
            .padding(.vertical, 10)
            .foregroundColor(Color("neutral"))
    }
}
