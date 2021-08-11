import SwiftUI

struct LessonIntroView: View {
    var lesson: Lesson

    var body: some View {
        Text(lesson.title)
    }
}
