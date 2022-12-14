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
                    NavigationLink(destination: ContentView(title: "Educação Financeira e Seus Aspectos", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                        Image("dollar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)

                        Spacer(minLength: 20)
                        Text("Educação Financeira e Seus Aspectos")
                    })
                }.overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.blue, lineWidth: 3)
                        .frame(width: 350, height: 65)
                )
            }.headerProminence(.increased)
            Section {
                NavigationLink(destination: ContentView(title: "Planejamento Financeiro e Sua Importância", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                    Image("planning")
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
                NavigationLink(destination: ContentView(title: "Renda Variável x Renda Fixa", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                    Image("pie-chart")
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
                    NavigationLink(destination: ContentView(title: "Bancos: Aliados ou Inimigos?", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                        Image("money")
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
                NavigationLink(destination: ContentView(title: "Uso e Precauções com Cartão de Crédito", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                    Image("credit-card")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Uso e Precauções com Cartão de Crédito")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
            Section {
                NavigationLink(destination: ContentView(title: "Juros Simples x Juros Compostos", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                    Image("budget")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Juros Simples x Juros Compostos")
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
                    NavigationLink(destination: ContentView(title: "Introdução a Renda Fixa", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                        Image("business-report")
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
                NavigationLink(destination: ContentView(title: "CDB x LCI", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                    Image("stats")
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
                NavigationLink(destination: ContentView(title: "Fundo Imobiliário e Poupança", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                    Image("save-money")
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
                    NavigationLink(destination: ContentView(title: "Tipos de Bancos e suas Relações", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                        Image("bank")
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
                NavigationLink(destination: ContentView(title: "Menores de idade podem investir?", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                    Image("problem")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Menores de idade podem investir?")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 350, height: 65)
            )
            Section {
                NavigationLink(destination: ContentView(title: "Vantagens e Desvantagens de Investimento", conts: ["C1", "C2", "C3", "C4", "C5"]), label: {
                    Image("earning")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    Spacer(minLength: 20)
                    Text("Vantagens e Desvantagens de Investimento")
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
        VStack {
            NavigationView {
                TabView {
                    InitialView1()
                    InitialView2()
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))

                .toolbar{
                    NavigationLink(destination: SettingsView(), label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.blue)
                    })
                }.background().ignoresSafeArea()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
