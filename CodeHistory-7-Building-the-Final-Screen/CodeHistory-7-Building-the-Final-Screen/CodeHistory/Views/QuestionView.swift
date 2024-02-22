//
//  QuestionView.swift
//  CodeHistory
//
//  Created by Felix Chadwick-Smith on 26/08/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel: GameViewModel
    let question: Question
    
    var body: some View {
        VStack {
            Text(question.questionText)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
            Spacer()
            HStack {
                ForEach(0..<question.possibleAnswers.count) { index in
                    Button {
                        viewModel.makeGuess(atIndex: index)
                        print("Tapped on option with the text: \(question.possibleAnswers[index])")
                    } label: {
                        ChoiceTextView(choiceText: question.possibleAnswers[index])
                            .background(viewModel.color(forOptionIndex: index))
                    }
                    .disabled(viewModel.guessWasMade)
                }
            }
            if viewModel.guessWasMade {
                Button(action: { viewModel.displayNextScreen() }) {
                    BottomTextView(str: "Next")
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Game().currentQuestion)
            .environmentObject(GameViewModel())
    }
}
