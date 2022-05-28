import Kingfisher
import SwiftUI

struct LessonCardView: View {
    var imageURL: String?
    var description: String
    var continueAction: () -> Void?

    var body: some View {
        VStack {
            if let imageName = imageURL {
                KFImage(URL(string: imageName))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }

            Text(description)
                .regularDescriptionFont()
                .padding(12)

            Button(action: {
                continueAction()
            }, label: {
                Text(AppStrings.Lesson.continueText.localized())
                    .lightButtonStyle()
            })
            .padding(.bottom)
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("gray800"), lineWidth: 1)
        )
    }
}
