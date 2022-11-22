//
//  ActivitiesView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 11/11/22.
//

import SwiftUI


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
    @State var progress: Double = 25
    @State var title = ["1. Primeira questão a ser colocada", "2. Selecione as opções corretas", "3. Leia o exemplo a seguir e assinale a alternativa correta"]
    @State var conts = ["Opções 1", "Opções 2", "Opções 3"]

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
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .frame(width: 350, height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.blue, lineWidth: 3)
                    )
                
                Text(conts[page])
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                if page == 2 {
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
                        if page < conts.count - 1 {
                            page += 1
                            progress += 25
                        }
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
}

struct EndingView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
