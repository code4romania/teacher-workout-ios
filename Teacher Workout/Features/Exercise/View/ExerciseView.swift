import SwiftUI

struct ExerciseView: View {
    @StateObject private var viewModel: ExerciseViewModel
    
    init(exercise: Exercise) {
        self._viewModel = .init(wrappedValue: ExerciseViewModel(exercise: exercise))
    }
        
    var body: some View {
        VStack {
            topBar
            questionAndProgressBar
                .padding(.top, 10)

            Spacer()
            answerButtons
            Spacer()
            
            continueButton
        }
        .padding([.trailing, .leading], 10)
    }
}

// MARK: - Views

extension ExerciseView {
    @ViewBuilder
    private var topBar: some View {
        HStack {
            Spacer()
            Text(AppStrings.Exercise.navigationTitle.localized())
                .font(Font.custom("Mulish-Bold", size: 20))
            Spacer()

            Button {
                print("Hello")
            } label: {
                Text("X")
                    .font(Font.custom("Mulish-Bold", size: 25))
                    .foregroundColor(.gray)
            }
        }
        Divider()
            .overlay(Color.black)
    }
    
    private var questionAndProgressBar: some View {
        VStack(spacing: 10) {
            ProgressBar(
                value: Binding<Float>.init(
                    get: { Float(viewModel.currentQuestionIndex) },
                    set: { newValue in
                        viewModel.currentQuestionIndex = Int(newValue)
                    })
            )
            .frame(height: 20)
            Text(viewModel.exercise.question)
                .font(Font.custom("Mulish-Bold", size: 20))
        }
    }
    
    private var answerButtons: some View {
        VStack(spacing: 10) {
            ForEach(viewModel.exercise.answers, id: \.hashValue) { answer in
                Button(action: {
                    viewModel.selectedAnswer = answer
                }, label: {
                    makeAnswerButton(answer)
                })
            }
        }
    }
    
    private var continueButton: some View {
        Button(action: {
            print("Continua")
        }, label: {
            Text(AppStrings.Exercise.continueButton.localized())
                .primaryButtonStyle()
        })
        .disabled(!viewModel.isSelectedAnswerValid)
    }
    
    @ViewBuilder
    private func makeAnswerButton(_ answer: Answer) -> some View {
        let answerState = viewModel.handleAnswerState(answer: answer)
        switch answerState {
        case .correctState:
            Text(answer.description)
                .primaryButtonStyle()
        case .failedState:
            Text(answer.description)
                .dangerButtonStyle()
        case .defaultState:
            Text(answer.description)
                .secondaryButtonStyle()
        }
    }
}

struct ExerciseView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercise: mockExercise)
    }
}

private let mockExercise = Exercise(question: "Aceasta este o intrebare pe baza careia vom desfasura acest exercitiu", answers: [
    Answer(description: "Raspuns 1", isCorrect: false),
    Answer(description: "Raspuns 2", isCorrect: true),
    Answer(description: "Raspuns 3", isCorrect: false),
])
