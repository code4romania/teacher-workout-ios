import SwiftUI

protocol LessonsListDelegate {
    func lessonsList(_ lessonsList: LessonsList, didSelectLesson lesson: Lesson)
}

struct LessonsList: View {
    var lessons: [Lesson]
    var delegate: LessonsListDelegate

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 290), spacing: 15)], spacing: 20) {
            ForEach(lessons) { lesson in
                LessonItemCell(item: lesson)
                    .frame(maxHeight: 74)
                    .onTapGesture {
                        self.delegate.lessonsList(self, didSelectLesson: lesson)
                    }
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
