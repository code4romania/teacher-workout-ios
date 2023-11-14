import SwiftUI

struct ExerciseView: View {
    @State private var stepValue: Float = 1
    @State private var selectedAnswer: Answer?

    var exercise: Exercise
    
    var body: some View {
        VStack {
            header
            Divider()
                .overlay(Color.black)
            
            Group {
                ProgressBar(value: $stepValue)
                    .frame(height: 20)
                question
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, 10)
            
            Spacer()
            
            selectAnswerButtons
                .padding([.leading, .trailing], 20)
            
            Spacer()

            continueButton
                .padding([.leading, .trailing], 20)

        }
    }
    
    // MARK: - Views
    
    @ViewBuilder
    private var header: some View {
        HStack {
            Spacer()
            Text("Exercitiu")
                .font(Font.custom("Mulish-Bold", size: 20))
            Spacer()
            Button {
                stepValue += 1
            } label: {
                Text("X")
                    .font(Font.custom("Mulish-Bold", size: 25))
                    .foregroundColor(.gray)
            }
        }
        .padding([.leading, .trailing], 20)
    }
    
    @ViewBuilder
    private var question: some View {
        Text(exercise.question)
            .font(Font.custom("mulish-Bold", size: 20))
    }
    
    @ViewBuilder
    private var selectAnswerButtons: some View {
        VStack(spacing: 10) {
            ForEach(exercise.answers, id: \.hashValue) { answer in
                Button(action: {
                    selectedAnswer = answer
                }, label: {
                    makeAnswerButton(answer)
                })
            }
        }
    }
    
    @ViewBuilder
    private func makeAnswerButton(_ answer: Answer) -> some View {
        if let selectedAnswer, selectedAnswer == answer {
            if selectedAnswer.isCorrect {
                Text(answer.description)
                    .primaryButtonStyle()
            } else {
                Text(answer.description)
                    .dangerButtonStyle()
            }
        } else {
            Text(answer.description)
                .secondaryButtonStyle()
        }
    }
    
    @ViewBuilder
    private var continueButton: some View {
        Button(action: {
            print("Continua")
        }, label: {
            Text("Continua")
                .primaryButtonStyle()
        })
        .disabled(selectedAnswer == nil)
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
