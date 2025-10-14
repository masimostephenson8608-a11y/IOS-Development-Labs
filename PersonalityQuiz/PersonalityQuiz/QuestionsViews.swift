//
//  QuestionsViews.swift
//  PersonalityQuiz
//
//  Created by Masimo Stephenson on 10/13/25.
//

import SwiftUI

/* `TitleView`, `QuestionFlowView`, `RangedQuestionSubview`, `MultipleQuestionSubview`, `SingleQuestionSubview`, and `ResultsView`. `QuestionFlowView` */

struct QuestionsView: View {
    var body: some View {
        Text("hi")
    }
}

struct QuestionFlowView: View {
    var body: some View {
        Text("hi")
    }
}

struct RangedQuestionSubview: View {
    @State private var rangeAnswer = 0.0
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("\(rangeAnswer.formatted(.number.precision(.fractionLength(0)))) out of 10")
                    .font(.title2).bold()
                Slider ( value: $rangeAnswer, in: 0...10, step: 1.0) {
                    Text("Range")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("10")
                }
                .onChange(of: rangeAnswer) {
                    rangeAnswer = rangeAnswer.rounded()
                }
                .frame(maxWidth: .infinity)
            }.padding(.horizontal, 40)
        }
    }
}

struct SingleQuestionSubview: View {
     var question: String
    var Options: [String]
    @State private var choice = ""
    var body: some View {
        ZStack {
            BackgroundView()
            if Options.count != 4 {
                Text("Incorrect initilization of Multiple Questions. Must be only 4 questions. No more, no less.")
            } else {
                NavigationStack {
                    VStack {
                        Text(question).font(.title2).bold()
                        Picker("Choose", selection: $choice) {
                            ForEach(Options, id: \.self) { text in
                                Text(text)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MultipleQuestionSubview: View {
    let questions: [String]
    @State private var answers: [Bool]
    
    init(questions: [String]) {
        self.questions = questions
        _answers = State(initialValue: Array(repeating: false, count: questions.count))
    }

    var body: some View {
        ForEach(0..<questions.count, id: \.self) {count in
            Toggle(questions[count], isOn: $answers[count])
        }
    }
}

struct ResultsView: View {
    var body: some View {
        Text("hi")
    }
}



//#Preview {
//    RangedQuestionSubview()
//}
//
#Preview {
    MultipleQuestionSubview(questions: ["Would you eat a dog?", "Would you swim in the ocean without a life jacket?"])
}
