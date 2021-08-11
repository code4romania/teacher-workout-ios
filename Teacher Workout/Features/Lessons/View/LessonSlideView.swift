import Kingfisher
import SwiftUI

struct LessonSlideView: View {
    var lesson: Lesson
    @State var stepValue: Float = 1

    var body: some View {
        ScrollView {
            ProgressBar(value: $stepValue).frame(height: 20)

            LessonTitleView(label: lesson.title)

            LessonCardView(imageURL: lesson.imageURL, description: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum")
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }

    // TEMP testing
    func startProgressBar() {
        for _ in 0 ... 80 {
            stepValue += 0.015
        }
    }

    func resetProgressBar() {
        stepValue = 0.0
    }
}
