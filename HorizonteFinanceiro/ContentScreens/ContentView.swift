//
//  ContentView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 01/11/22.
//

import SwiftUI


struct ContentView: View {
    @State var expl = ""
    @State var dica = ""
    @State var page = -1
    @State var idea = false
    @State var conts = ["Conteúdo 1", "Conteúdo 2", "Conteúdo 3"]

    var body: some View {
        NavigationView {
            VStack {
                Text("Educação Financeira e Seus Aspectos")
                    .bold()
                    .font(.title)
                    .frame(width: 400, height: 200)
                    .multilineTextAlignment(.center)
                    .navigationBarTitleDisplayMode(.inline)

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .frame(width: 350, height: 350)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue, lineWidth: 3)
                        )

                    Text(expl)
                }

                Spacer()
                
                HStack {
                    Button {
                        if idea {
                            dica = ""
                            idea = false
                        } else {
                            dica = "Essa é uma dica!"
                            idea = true
                        }
                    } label: {
                        Image(systemName: "lightbulb.fill")
                             .resizable()
                             .scaledToFit()
                             .foregroundColor(.yellow)
                             .frame(width: 64, height: 44)
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .frame(width: 275, height: 64)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.blue, lineWidth: 3)
                            )

                        Text(dica)
                    }
                }

                Spacer()

                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button {
                                if page >= 1 {
                                    page -= 1
                                    expl = conts[page]
                                }
                            } label: {
                                Image(systemName: "arrow.left.square")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.blue)
                                    .frame(width: 48, height: 48)
                            }

                            Spacer()

                            Button {
                                if page < conts.count - 1 {
                                    page += 1
                                    expl = conts[page]
                                }
                            } label: {
                                Image(systemName: "arrow.right.square")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.blue)
                                    .frame(width: 48, height: 48)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
