import SwiftUI

protocol LessonIntroViewDelegate {
    func lessonIntroViewDidTapClose(_ view: LessonIntroView)
    func lessonIntroViewDidTapStartLesson(_ view: LessonIntroView)
    func lessonIntroViewDidTapSaveLesson(_ view: LessonIntroView)
}

struct LessonIntroView: View {
    var lesson: Lesson
    var delegate: LessonIntroViewDelegate?

    var body: some View {
        ZStack {
            Color("emeraldFaded")
                .ignoresSafeArea()
            VStack {
                TrailingCloseButton {
                    self.delegate?.lessonIntroViewDidTapClose(self)
                }
                .padding(20)

                Spacer()

                Image("lesson_start_hero")

                Text(lesson.title)
                    .font(Font.custom("Mulish-Bold", size: 20))
                    .padding(16)
                    .foregroundColor(Color.black)

                Text(lesson.themeTitle)
                    .foregroundColor(Color("AccentColor"))
                    .font(Font.custom("Mulish-SemiBold", size: 12))
                    .padding(.horizontal)

                HStack(spacing: 4) {
                    Image(systemName: "clock")
                    Text(lesson.duration)
                }
                .font(Font.custom("Mulish-SemiBold", size: 12))
                .foregroundColor(Color("AccentColor"))
                .padding(6)

                Button(action: {
                    self.delegate?.lessonIntroViewDidTapStartLesson(self)
                }, label: {
                    Text(AppStrings.Lesson.Intro.startLesson.rawValue.localized())
                        .primaryButtonStyle()
                        .padding()
                })
                Button(action: {
                    self.delegate?.lessonIntroViewDidTapSaveLesson(self)
                }, label: {
                    Text(AppStrings.Lesson.Intro.saveLesson.rawValue.localized())
                        .secondaryButtonStyle()
                        .padding(.horizontal)
                })

                Spacer()
            }
        }
    }
}
