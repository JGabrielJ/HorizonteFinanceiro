//
//  ActivitiesView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 11/11/22.
//

import SwiftUI


struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
}

struct RoundRectStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 250, height: 30)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 3)
                )

            RoundedRectangle(cornerRadius: 15)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 30)
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct CircularProgress: View {
    @Binding var percentage: Float

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 17)
                .foregroundColor(Color.red)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.percentage, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 17, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear, value: 1)
        }
    }
}

struct ActivitiesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Agora vamos por em prática o que aprendemos")
                    .bold()
                    .padding()
                    .font(.title)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)

                NavigationLink(destination: ActView(), label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .frame(width: 250, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.blue, lineWidth: 3)
                            )

                        Text("Começar Atividade")
                            .foregroundColor(.black)
                    }
                })
            }
        }
    }
}

struct ActView: View {
    @State var page = 0
    @State var progress: Double = 20

    @State var title = ["1. Primeira questão a ser colocada", "2. Primeira questão a ser colocada", "3. Selecione as opções corretas", "4. Selecione as opções corretas", "5. Leia o exemplo a seguir e assinale a alternativa correta"]
    @State var tasks = [Task(name: "Primeira Opção", isCompleted: false), Task(name: "Segunda Opção", isCompleted: false), Task(name: "Terceira Opção", isCompleted: false)]

    var body: some View {
        VStack {
            ProgressView(value: progress, total: 100)
                .padding()
                .progressViewStyle(RoundRectStyle())

            Text(title[page])
                .font(.title)
                .frame(width: 350, height: 150)
                .multilineTextAlignment(.leading)
                .navigationBarTitleDisplayMode(.inline)

            ZStack {
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
                    .background(.white)
                    .scrollContentBackground(.hidden)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.blue, lineWidth: 3)
                            .frame(width: 350, height: 180)
                            .position(x: 195, y: 105)
                    )
                }
            }

            HStack {
                Spacer()

                if progress >= 100 {
                    NavigationLink(destination: EndingView(), label: {
                        Image(systemName: "arrow.right.square")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.blue)
                            .frame(width: 48, height: 48)
                            .padding()
                    })
                } else {
                    Button {
                        if page < title.count - 1 {
                            page += 1
                        }
                        self.progressBarAnimation()
                    } label: {
                        Image(systemName: "arrow.right.square")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.blue)
                            .frame(width: 48, height: 48)
                            .padding()
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }

    func progressBarAnimation() {
        var initialProgress = self.progress

        _ = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true) { timer in withAnimation() {
                self.progress += 1
                if self.progress >= initialProgress + 20 {
                    timer.invalidate()
                    initialProgress += 20
                }
            }
        }
    }
}

struct EndingView: View {
    @State var perc: Float = 0.0

    var body: some View {
        VStack {
            Text("Meus parabéns!\nAtividade concluída com sucesso!")
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
                .navigationBarTitleDisplayMode(.inline)

            Spacer()
                .frame(height: 30)

            Text("Total de Questões: 5")
                .bold()
                .padding()
                .font(.title2)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .navigationBarTitleDisplayMode(.inline)

            Spacer()
                .frame(height: 50)
            
            ZStack {
                CircularProgress(percentage: self.$perc)
                    .frame(width: 150, height: 150)

                Text(String(format: "%.0f%%", min(self.perc, 1.0) * 100))
                    .bold()
                    .font(.largeTitle)
            }

            Spacer()
                .frame(height: 50)
            
            HStack {
                NavigationLink(destination: FeedbacksView(), label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .frame(width: 150, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                            )

                        Text("Finalizar Atividade")
                            .foregroundColor(.black)
                    }
                })

                Spacer()
                    .frame(width: 35)

                NavigationLink(destination: ActView(), label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .frame(width: 150, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                            )

                        Text("Tentar novamente")
                            .foregroundColor(.black)
                    }
                })
            }

            Button {
                self.circularProgressAnimation()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .frame(width: 150, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                        )

                    Text("Verificar Resultado")
                        .foregroundColor(.black)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }

    func circularProgressAnimation() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true) { timer in withAnimation() {
                self.perc += 0.01
                if self.perc >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
