import SwiftUI

protocol ExerciseViewDelegate {
    func didSubmitAnswer(_ answer: Answer)
}

struct ExerciseView: View {
    @StateObject private var viewModel: ExerciseViewModel
    var delegate: ExerciseViewDelegate?
    
    init(exercise: Exercise, delegate: ExerciseViewDelegate? = nil) {
        self._viewModel = .init(wrappedValue: ExerciseViewModel(exercise: exercise))
        self.delegate = delegate
    }
        
    var body: some View {
        VStack {
            questionAndProgressBar
                .padding(.top, 10)

            Spacer()
            answerButtons
            Spacer()
            
            continueButton
        }
        .padding([.trailing, .leading], 20)
        .navigationTitle(Text(AppStrings.Exercise.navigationTitle.localized()))
    }
}

// MARK: - Views

extension ExerciseView {
    private var questionAndProgressBar: some View {
        VStack {
            ProgressBar(
                value: Binding<Float>.init(
                    get: { Float(viewModel.currentQuestionIndex) },
                    set: { newValue in
                        viewModel.currentQuestionIndex = Int(newValue)
                    })
            )
            .frame(height: 20)
            Text(viewModel.exercise.question)
                .font(Font.custom("Mulish-SemiBold", size: 20))
                .padding(.top, 10)
        }
    }
    
    private var answerButtons: some View {
        VStack {
            ForEach(viewModel.exercise.answers, id: \.hashValue) { answer in
                Button(action: {
                    viewModel.selectedAnswer = answer
                }, label: {
                    if viewModel.isVerifying {
                        makeVerifiedAnswerButton(answer)
                    } else {
                        makeAnswerButton(answer)
                    }
                })
                .padding(.bottom, 10)
            }
        }
    }
    
    private var continueButton: some View {
        Button(action: {
            if !viewModel.isVerifying {
                viewModel.isVerifying.toggle()
            } else {
                guard let selectedAnswer = viewModel.selectedAnswer else { return }
                delegate?.didSubmitAnswer(selectedAnswer)
            }
        }, label: {
            let buttonTitle = viewModel.isVerifying ? AppStrings.Exercise.continueButton.localized() : AppStrings.Exercise.verifyButton.localized()
            Text(buttonTitle)
                .primaryButtonStyle()
        })
        .disabled(!viewModel.isSelectedAnswerValid)
        .padding(.bottom, 5)
    }
    
    @ViewBuilder
    private func makeVerifiedAnswerButton(_ answer: Answer) -> some View {
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
    
    @ViewBuilder
    private func makeAnswerButton(_ answer: Answer) -> some View {
        if answer == viewModel.selectedAnswer {
            Text(answer.description)
                .primaryButtonStyle()
        } else {
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

private let mockExercise = Exercise(
    question: "Aici este textul unei intrebari bazate pe informatii parcurse in ecranele anterioare",
    answers: [
        Answer(description: "Raspuns 1", isCorrect: false),
        Answer(description: "Raspuns 2", isCorrect: true),
        Answer(description: "Raspuns 3", isCorrect: false),
    ])
