import Kingfisher
import SwiftUI

struct LessonItemCell: View {
    var item: Lesson

    var body: some View {
        HStack(spacing: 15) {
            if let imageName = item.imageURL {
                KFImage(URL(string: imageName))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 74)
                    .clipped()
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .font(Font.custom("Mulish-Regular", size: 14))

                Text(item.themeTitle)
                    .foregroundColor(Color("AccentColor"))
                    .font(Font.custom("Mulish-SemiBold", size: 12))

                HStack(spacing: 4) {
                    Image(systemName: "clock")
                    Text(item.duration)
                }.font(Font.custom("Mulish-SemiBold", size: 12))
            }
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
