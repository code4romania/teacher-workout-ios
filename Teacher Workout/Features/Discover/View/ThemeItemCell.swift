import Kingfisher
import SwiftUI

struct ThemeItemCell: View {
    var item: Theme

    var body: some View {
        HStack(spacing: 15) {
            if let imageName = item.imageURL {
                KFImage(URL(string: imageName))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 57)
                    .clipped()
            }

            Text(item.title)
                .font(Font.custom("Mulish-Regular", size: 14))
            Spacer()
        }
        .background(Color("backgroundColor"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("AccentColor"), lineWidth: 0.5)
        )
    }
}
