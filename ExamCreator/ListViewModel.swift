import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var questions: [QuestionCell]
    @Published var correctAnswerCount: Int
    @Published var wrongAnswerCount: Int
    @Published var invalidAnswerCount: Int
    @Published var questionCount: Int
    @Published var showingActionSheet = false
    @Published var userGrade: Int
    @Published var pointPerQuestion: Int
    
    init() {
        questionCount = 10
        correctAnswerCount = 0
        wrongAnswerCount = 0
        invalidAnswerCount = 0
        userGrade = 0
        pointPerQuestion = 0
        questions = []
        for _ in 0..<questionCount {
            questions.append(QuestionCell())
        }
    }
    
    func submitButtonTapped() {
        correctAnswerCount = 0
        wrongAnswerCount = 0
        invalidAnswerCount = questionCount
        userGrade = 0
        pointPerQuestion = 100/questionCount
        showingActionSheet.toggle()
        
        questions.forEach { question in
            question.answerImageSelector()
            if let userAnswer = Int(question.answerInput) {
                if question.question.trueAnswer == userAnswer {
                    correctAnswerCount += 1
                    invalidAnswerCount -= 1
                    userGrade += pointPerQuestion
                } else {
                    wrongAnswerCount += 1
                    invalidAnswerCount -= 1
                }
            }
        }
    }
    
    func restartExam(){
        questionCount = 10
        correctAnswerCount = 0
        wrongAnswerCount = 0
        invalidAnswerCount = 0
        userGrade = 0
        pointPerQuestion = 0
        questions = []
        for _ in 0..<questionCount {
            questions.append(QuestionCell())
        }
    }
}
