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
    @State var title = ""
    @State var progress: Double = 25
    @State var conts = ["", "", "", "", ""]

    var body: some View {
        ProgressView(value: progress, total: 100)
            .progressViewStyle(RoundRectStyle())
        
        Text("1. Primeira questão a ser colocada")
            .padding()
            .font(.title)
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
