import Kingfisher
import SwiftUI

protocol LessonSlideViewDelegate {
    func lessonSlideViewDidTapContinue(_ view: LessonSlideView)
}

struct LessonSlideView: View {
    var lesson: Lesson
    var delegate: LessonSlideViewDelegate?

    @State var stepValue: Float = 1

    var body: some View {
        ScrollView {
            ProgressBar(value: $stepValue).frame(height: 20)

            LessonTitleView(label: lesson.title)

            LessonCardView(imageURL: lesson.imageURL,
                           description: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
                           continueAction: continueAction)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }

    func continueAction() {
        delegate?.lessonSlideViewDidTapContinue(self)
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
