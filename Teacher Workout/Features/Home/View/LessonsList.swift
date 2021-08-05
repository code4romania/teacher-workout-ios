import SwiftUI

struct LessonsList: View {
    var lessons: [Lesson]

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 290), spacing: 15)], spacing: 20) {
            ForEach(lessons) { lesson in
                LessonItemCell(item: lesson)
                    .frame(maxHeight: 74)
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
