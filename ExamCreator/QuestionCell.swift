import Foundation
import SwiftUI

class QuestionCell: ObservableObject {
    @Published var answerImage: Image
    @Published var answerInput = ""
    
    var question = Question()
    
    init() {
        answerImage = Image(systemName: "questionmark.circle")
    }
    
    func answerImageSelector() {
        if let userAnswer = Int(answerInput) {
            if question.trueAnswer == userAnswer {
                answerImage = Image(systemName: "checkmark.circle.fill")
            } else {
                answerImage = Image(systemName: "xmark.circle")
            }
        } else {
            answerImage = Image(systemName: "questionmark.circle")
        }
    }

}
