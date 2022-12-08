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
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ContentView(), label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.blue)
                                .frame(width: 24, height: 24)

                            Text("Back")
                                .foregroundColor(.blue)
                        }
                    })
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ActView: View {
    @State var page = 0
    @State var progress: Double = 34

    @State var title = ["1. Primeira questão a ser colocada", "2. Selecione as opções corretas", "3. Leia o exemplo a seguir e assinale a alternativa correta"]
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
                    if page == 0 {
                        HStack {
                            RadioButtonGroups { selected in
                                print("Selected Option is: \(selected)")
                            }.position(x: 200, y: 85)
                        }.padding()
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue, lineWidth: 3)
                                .frame(width: 350, height: 180)
                                .position(x: 195, y: 105)
                        )
                    } else if page == 1 {
                        List($tasks) { $task in
                            HStack {
                                Image(systemName: task.isCompleted ? "checkmark.square": "square")
                                    .onTapGesture {
                                        task.isCompleted.toggle()
                                    }
                                
                                Text(task.name)
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue, lineWidth: 3)
                                .frame(width: 350, height: 180)
                                .position(x: 195, y: 105)
                        )
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                                .frame(width: 350, height: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.blue, lineWidth: 3)
                                )

                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                                .padding()
                                .foregroundColor(.black)
                                .frame(width: 350, height: 200)
                        }
                        HStack {
                            RadioButtonGroups { selected in
                                print("Selected Option is: \(selected)")
                            }.position(x: 200, y: 85)
                        }.padding()
                        .background(.white)
                    }
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
                if self.progress >= initialProgress + 33 {
                    timer.invalidate()
                    initialProgress += 33
                }
            }
        }
    }
}

struct EndingView: View {
    @State var perc: Float = 0.0
    @State var isPresentation = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Meus parabéns!\nAtividade concluída com sucesso!")
                    .padding()
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .navigationBarTitleDisplayMode(.inline)

                Spacer()
                    .frame(height: 30)

                Text("Total de Questões: 3")
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
                    Button {
                        self.isPresentation.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                                .frame(width: 150, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.black, lineWidth: 3)
                                )
                            
                            Text("Visualizar Gabarito")
                                .foregroundColor(.black)
                        }
                    }.sheet(isPresented: $isPresentation, content: {
                        FeedbackView(isPresented: $isPresentation)
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
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: InitialView(), label: {
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.blue)
                            .frame(width: 48, height: 48)
                    })
                }
            }
        }.navigationBarBackButtonHidden(true)
    }

    func circularProgressAnimation() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true) { timer in withAnimation() {
                self.perc += 0.01
                if self.perc >= 0.50 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct FeedbackView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Divider()

            Text(ActView().title[0])
                .bold()
                .font(.title2)

            HStack {
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(ActView().tasks[0].name)
            }
            
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(ActView().tasks[1].name)
            }.foregroundColor(.red)
            
            HStack {
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(ActView().tasks[2].name)
            }.foregroundColor(.green)

            Divider()
        }.frame(width: 350, height: 150)

        VStack(alignment: .leading) {
            Text(ActView().title[1])
                .bold()
                .font(.title2)

            HStack {
                Image(systemName: "square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(ActView().tasks[0].name)
            }.foregroundColor(.green)

            HStack {
                Image(systemName: "checkmark.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(ActView().tasks[1].name)
            }.foregroundColor(.red)

            HStack {
                Image(systemName: "checkmark.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(ActView().tasks[2].name)
            }.foregroundColor(.green)

            Divider()
        }.frame(width: 350, height: 150)

        VStack(alignment: .leading) {
            Text(ActView().title[2])
                .bold()
                .font(.title2)

            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)

                Text(ActView().tasks[0].name)
            }.foregroundColor(.green)

            HStack {
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(ActView().tasks[1].name)
            }
            
            HStack {
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)

                Text(ActView().tasks[2].name)
            }
            
            Divider()
        }.frame(width: 350, height: 175)
        
        Spacer()
            .frame(height: 25)

        Button {
            self.isPresented.toggle()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 75, height: 50)

                Text("OK")
                    .foregroundColor(.white)
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
