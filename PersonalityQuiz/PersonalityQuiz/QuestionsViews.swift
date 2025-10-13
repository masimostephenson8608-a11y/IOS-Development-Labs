//
//  QuestionsViews.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

/* `TitleView`, `QuestionFlowView`, `RangedQuestionSubview`, `MultipleQuestionSubview`, `SingleQuestionSubview`, and `ResultsView`. `QuestionFlowView` */

struct QuestionsViews: View {
    var body: some View {
        Text("hi")
    }
}

struct TitleView: View {
    var body: some View {
        Text("Welcome to my").font(.headline.weight(.heavy))
        Text("Personality Quiz").font(.largeTitle.bold())
    }
}

#Preview {
    TitleView()
}
