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
    @State var title = ""
    @State var conts = ["", "", "", "", ""]

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Text(title)
                    .bold()
                    .font(.title)
                    .padding()
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
                            if page == 0 {
                                NavigationLink(destination: InitialView(), label: {
                                    Image(systemName: "arrow.left.square")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.blue)
                                        .frame(width: 48, height: 48)
                                })
                            } else {
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
        }.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
