import SwiftUI

protocol LessonFinishedViewDelegate {
    func lessonFinishedViewDidTapClose(_ view: LessonFinishedView)
    func lessonFinishedViewDidTapShare(_ view: LessonFinishedView)
}

struct LessonFinishedView: View {
    var delegate: LessonFinishedViewDelegate?

    var body: some View {
        VStack {
            TrailingCloseButton {
                self.delegate?.lessonFinishedViewDidTapClose(self)
            }
            .padding(20)

            Spacer()

            Image("lesson_finished_hero")

            Spacer()

            Text("+ 10 XP")
                .foregroundColor(Color("AccentColor"))
                .boldLargeFont(size: 32)
                .padding(.horizontal)

            Spacer()

            VStack(spacing: 18) {
                Text(AppStrings.Lesson.Finished.titleText.localized())
                    .foregroundColor(Color("neutral"))
                    .boldLargeFont(size: 20)
                    .padding(.horizontal)

                Text(AppStrings.Lesson.Finished.subtitleText.localized())
                    .foregroundColor(Color("neutral"))
                    .semiBoldSmallFont(size: 16)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 48)
            }

            Spacer()

            Group {
                Button(action: {
                    self.delegate?.lessonFinishedViewDidTapClose(self)
                }, label: {
                    Text(AppStrings.Lesson.continueText.localized())
                        .primaryButtonStyle()
                        .padding()
                })

                Button(action: {
                    self.delegate?.lessonFinishedViewDidTapShare(self)
                }, label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text(AppStrings.Lesson.Finished.share.localized())
                    }.foregroundColor(Color("AccentColor"))
                        .boldLargeFont(size: 16)
                })
            }

            Spacer()
        }.navigationBarHidden(true)
    }
}
