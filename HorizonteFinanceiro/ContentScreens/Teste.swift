import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
}

struct CheckboxView: View {
    @State var tasks = [Task(name: "Primeira Opção", isCompleted: false), Task(name: "Segunda Opção", isCompleted: false), Task(name: "Terceira Opção", isCompleted: false)]
    var body: some View {
        VStack {
            List($tasks) { $task in
                HStack {
                    Image(systemName: task.isCompleted ? "checkmark.square": "square")
                        .onTapGesture {
                            task.isCompleted.toggle()
                        }
                    Text(task.name)
                }
            }
        }
    }
}
struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView()
    }
}
