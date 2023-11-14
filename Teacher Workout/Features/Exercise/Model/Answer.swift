//
//  Answer.swift
//  Teacher Workout
//
//  Created by Solomon Alexandru on 14.11.2023.
//

import Foundation

struct Answer {
    let description: String
    let isCorrect: Bool
}

extension Answer: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}
