//
//  QuestionCellView.swift
//  ExamCreator
//
//  Created by Can on 8.10.2023.
//

import SwiftUI

struct QuestionCellView: View {
    @ObservedObject var questionCell: QuestionCell

    var body: some View {
        HStack {
            Text("\(questionCell.question.number1) \(questionCell.question.sign) \(questionCell.question.number2)  = ")
            
            TextField("?", text: $questionCell.answerInput)
                .keyboardType(.numberPad)
            
            questionCell.answerImage
        }.font(.custom("Georgia", size: 25))
    }
}


#Preview {
    QuestionCellView(questionCell: QuestionCell())
        .padding()
}
