import SwiftUI

protocol LessonIntroViewDelegate: AnyObject {
    func lessonIntroViewDidTapClose(_ view: LessonIntroView)
    func lessonIntroViewDidTapStartLesson(_ view: LessonIntroView, lesson: Lesson)
    func lessonIntroViewDidTapSaveLesson(_ view: LessonIntroView)
}

struct LessonIntroView: View {
    @ObservedObject var viewModel = LessonIntroViewModel()

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
                    .boldLargeFont()
                    .padding(16)
                    .foregroundColor(Color.black)

                Text(lesson.themeTitle)
                    .foregroundColor(Color("AccentColor"))
                    .semiBoldSmallFont()
                    .padding(.horizontal)

                HStack(spacing: 4) {
                    Image(systemName: "clock")
                    Text(lesson.duration)
                }
                .semiBoldSmallFont(size: 14)
                .foregroundColor(Color("AccentColor"))
                .padding(6)

                Button(action: {
                    self.viewModel.saveLesson(lessonId: lesson.id)
                    self.delegate?.lessonIntroViewDidTapStartLesson(self, lesson: self.lesson)
                }, label: {
                    Text(AppStrings.Lesson.Intro.startLesson.localized())
                        .primaryButtonStyle()
                        .padding()
                })
                Button(action: {
                    self.viewModel.saveLesson(lessonId: lesson.id)
                    self.delegate?.lessonIntroViewDidTapSaveLesson(self)
                }, label: {
                    Text(AppStrings.Lesson.Intro.saveLesson.localized())
                        .secondaryButtonStyle()
                        .padding(.horizontal)
                })

                Spacer()
            }
        }
    }
}
