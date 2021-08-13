@testable import Teacher_Workout
import ViewInspector
import XCTest

extension LessonIntroView: Inspectable {}

class Teacher_WorkoutUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func mockedLessonObject() -> Lesson {
        let lessonId = "1"
        let lessonTitle = "Lesson Test Title"
        let themeTitle = "Lesson Theme Title Test"
        let duration = "24"
        return Lesson(id: lessonId,
                      title: lessonTitle,
                      imageURL: nil,
                      themeTitle: themeTitle,
                      duration: duration)
    }

    func testLessonIntroViewTitle() throws {
        let mockedLesson = mockedLessonObject()

        let lessonIntroView = LessonIntroView(lesson: mockedLesson)

        let title = try lessonIntroView.inspect().zStack().vStack(1).text(3).string()
        XCTAssertEqual(title, mockedLesson.title)
    }
}
