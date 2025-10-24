//
//  ViewModels.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/22/25.
//

import Foundation
import SwiftUI

@Observable
class RangedQuestionViewModel {
    var isDone = false
    let question: Question
    var rangeAnswer = 5.0
    let manager: QuizManager
    
    init(question: Question, manager: QuizManager) {
        self.question = question
        self.manager = manager
    }
    
    func doneClicked() {
        rangeAnswer != 0 ? manager.selectAnswer(manager.questionList[2].answers[Int(rangeAnswer) - 1]) : manager.selectAnswer(manager.questionList[2].answers[0])
                                                
        isDone = true
        manager.currentQuestion += 1

    }
    
}
