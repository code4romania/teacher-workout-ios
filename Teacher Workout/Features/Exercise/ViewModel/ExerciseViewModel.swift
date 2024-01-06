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
    
    var isSelectedAnswerValid: Bool {
        selectedAnswer != nil
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
