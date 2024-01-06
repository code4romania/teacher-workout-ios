//
//  ExerciseViewModel.swift
//  Teacher Workout
//
//  Created by Solomon Alexandru on 14.11.2023.
//

import Foundation
import SwiftUI

final class ExerciseViewModel: ObservableObject {
    enum AnswerState {
        case defaultState, correctState, failedState
    }
    
    @Published var selectedAnswer: Answer?
    @Published var currentQuestionIndex: Int = 10
    
    var exercise: Exercise
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    // MARK: Helpers and computed properties
    
    var isSelectedAnswerValid: Bool {
        selectedAnswer != nil
    }
    
    var isAnswerCorrect: Bool {
        guard let selectedAnswer else { return false }
        return selectedAnswer.isCorrect
    }
    
    func handleAnswerState(answer: Answer) -> AnswerState {
        if answer == selectedAnswer {
            if answer.isCorrect {
                return .correctState
            } else {
                return .failedState
            }
        }
        return .defaultState
    }
}
