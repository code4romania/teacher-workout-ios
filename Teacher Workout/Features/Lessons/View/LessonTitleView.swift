import SwiftUI

struct LessonTitleView: View {
    var label: String

    var body: some View {
        HStack {
            Text(label)
                .font(Font.custom("Mulish-Bold", size: 18))
                .padding(.vertical)
                .foregroundColor(Color("gray800"))
            Spacer()
        }
    }
}
