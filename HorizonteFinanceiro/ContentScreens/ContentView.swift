//
//  ContentView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 01/11/22.
//

import SwiftUI


struct TipElement: View {
    @State var tip = ""
    @State var idea = false

    var body: some View {
        HStack {
            Button {
                if idea {
                    tip = ""
                    idea = false
                } else {
                    tip = "Essa é uma dica!"
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

                Text(tip)
            }
        }
    }
}

struct ContentView: View {
    @State var page = 0
    @State var notice = ""
    @State var conts = ["Conteúdo 1", "Conteúdo 2", "Conteúdo 3", "Conteúdo 4", "Conteúdo 5"]

    var body: some View {
        NavigationView {
            VStack {
                Text("Educação Financeira e Seus Aspectos")
                    .bold()
                    .font(.title)
                    .frame(width: 400, height: 200)
                    .multilineTextAlignment(.center)
                    .navigationBarTitleDisplayMode(.inline)

                Text(notice)
                    .bold()

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .frame(width: 350, height: 350)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue, lineWidth: 3)
                        )

                    Text(conts[page])
                        .foregroundColor(.black)
                }

                Spacer()

                if page == 2 {
                    TipElement()
                }

                Spacer()

                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button {
                                if page >= 1 {
                                    page -= 1
                                    if page == 3 {
                                        notice = "Fique de 👀 no exemplo"
                                    } else if page == 4 {
                                        notice = "Fique atento a um detalhe"
                                    } else {
                                        notice = ""
                                    }
                                }
                            } label: {
                                Image(systemName: "arrow.left.square")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.blue)
                                    .frame(width: 48, height: 48)
                            }

                            Spacer()

                            if page == 4 {
                                NavigationLink(destination: ActivitiesView(), label: {
                                        Image(systemName: "arrow.right.square")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.blue)
                                            .frame(width: 48, height: 48)
                                    })
                            } else {
                                Button {
                                    if page < conts.count - 1 {
                                        page += 1
                                        if page == 3 {
                                            notice = "Fique de 👀 no exemplo"
                                        } else if page == 4 {
                                            notice = "Fique atento a um detalhe"
                                        } else {
                                            notice = ""
                                        }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
