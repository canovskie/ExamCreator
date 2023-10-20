import SwiftUI

struct ContentView: View {
    @StateObject var listViewModel = ListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(listViewModel.questions.indices, id: \.self) { questionBlock in
                    let question = listViewModel.questions[questionBlock]
                    QuestionCellView(questionCell: question)
                }
            }
            .listStyle(.inset)
                
                       
            Button("Submit") {
                listViewModel.submitButtonTapped()
            }.actionSheet(isPresented: $listViewModel.showingActionSheet) {
                ActionSheet(
                    title: Text("Point:\(listViewModel.userGrade)"),
                    message: Text("Correct: \(listViewModel.correctAnswerCount)\n Wrong: \(listViewModel.wrongAnswerCount)\n Invalid: \(listViewModel.invalidAnswerCount)"),
                    buttons: [
                        .default(Text("Restart")) {
                            listViewModel.restartExam()
                        },
                        .cancel()
                    ]
                )
            }
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
