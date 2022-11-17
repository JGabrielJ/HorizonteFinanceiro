//
//  InitialView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 27/10/22.
//

import SwiftUI

// NavigationView e Toolbar
struct InitialView1: View {
    var body: some View {
        Form {
            Section("Introdução ao Mundo Financeiro") {
                HStack {
                    NavigationLink(destination: Text("Conteúdo 1"), label:{
                        Image("Hands - Coin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                        
                        Spacer(minLength: 20)
                        Text("Planejamento Financeiro e Sua Importância")
                    })
                }.overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.blue, lineWidth: 3)
                        .frame(width: 350, height: 65)
                )
            }.headerProminence(.increased)
            Section {
                NavigationLink(destination: Text("Conteúdo 2"), label:{
                    Image("Planejamento")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Planejamento Financeiro e Sua Importância")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
            Section {
                NavigationLink(destination: Text("Conteúdo 3"), label:{
                    Image("Variável x Fixa")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Renda Variável x Renda Fixa")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
            Section("Investimentos e Conta Bancária") {
                HStack {
                    NavigationLink(destination: Text("Conteúdo 4"), label:{
                        Image("Cash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                        Spacer(minLength: 20)
                        Text("Bancos: Aliados ou Inimigos?")
                    })
                }.overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.blue, lineWidth: 3)
                        .frame(width: 350, height: 65)
                )
            }.headerProminence(.increased)
            Section {
                NavigationLink(destination: Text("Conteúdo 5"), label:{
                    Image("Creditcard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Uso e Precaução")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
            Section {
                NavigationLink(destination: Text("Conteúdo 6"), label:{
                    Image("Juros")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Juros Composto x Juros Variável")
                    })
                }.overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.blue, lineWidth: 3)
                        .frame(width: 350, height: 65)
                )
            }.headerProminence(.increased)
        }
    }
struct InitialView2: View {
    var body: some View {
        Form {
            Section("Renda Fixa") {
                HStack {
                    NavigationLink(destination: Text("Conteúdo 7"), label:{
                        Image("Chart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                        Spacer(minLength: 20)
                        Text("Introdução a Renda Fixa")
                    })
                }.overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.blue, lineWidth: 3)
                        .frame(width: 350, height: 65)
                )
            }.headerProminence(.increased)
            Section {
                NavigationLink(destination: Text("Conteúdo 8"), label:{
                    Image("Give")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("CDB x LCI")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
            Section {
                NavigationLink(destination: Text("Conteúdo 9"), label:{
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Fundo Imobiliário e Poupança")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
            Section("Bancos e Investimentos") {
                HStack {
                    NavigationLink(destination: Text("Conteúdo 10"), label:{
                        Image("")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                        Spacer(minLength: 20)
                        Text("Tipos de Bancos e suas Relações")
                    })
                }.overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.blue, lineWidth: 3)
                        .frame(width: 350, height: 65)
                )
            }.headerProminence(.increased)
            Section {
                NavigationLink(destination: Text("Conteúdo 11"), label: {
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Menores de idade podem investir ?")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
            Section{
                NavigationLink(destination: Text("Conteúdo 12"), label: {
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Vantagens e Desvantagens de investimento ")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
        }
    }
}
struct InitialView: View {
    var body: some View {
        VStack{
            NavigationView {
                TabView {
                    InitialView1()
                    InitialView2()
                }.tabViewStyle(.page(indexDisplayMode: .never))
                    .toolbar{
                        NavigationLink(destination: OptionView(),label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.blue)
                        })
                    }
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            HStack {
                                NavigationLink(destination: InitialView(), label: {
                                    VStack {
                                        Image(systemName: "house")
                                        Text("Ínicio")
                                    }.position(x: 55, y: 20)
                                })
                                Spacer()
                                NavigationLink(destination: ContentView(), label: {
                                    VStack {
                                        Image(systemName: "book")
                                        Text("Atividades")
                                    }
                                }).position(x: 115, y: 25)
                                Spacer()
                                NavigationLink(destination: ContentView(), label: {
                                    VStack {               Image(systemName: "lightbulb")
                                        Text("Explorar")
                                            .foregroundColor(.blue)
                                    }
                                }).position(x: 90, y: 25)
                            }
                        }
                }.bold()
            }
        }
    }
}


struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
