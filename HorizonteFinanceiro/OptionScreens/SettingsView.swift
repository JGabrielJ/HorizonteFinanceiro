//
//  SettingsView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 22/11/22.
//

import SwiftUI


struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Form {
                    Section {
                        NavigationLink(destination: ProfileView()) {
                            HStack {
                                Image("Perfil2")
                                    .resizable()
                                    .frame(width: 80, height: 70)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.blue, lineWidth: 2.5)
                                    )
                                    .shadow(radius: 10)
                                    .frame(width: 70)

                                Spacer()
                                    .frame(width: 20)

                                VStack(alignment: .leading) {
                                    Text(NSUserName())
                                        .font(.title2)

                                    Text("Usuário, Notificação e Senha")
                                        .font(.footnote)
                                }
                            }
                        }
                    }

                    Section {
                        NavigationLink(destination: Text("Idioma do App")) {
                            HStack {
                                Image(systemName: "globe")
                                    .foregroundColor(.blue)
                                    .font(.title)
                                    .frame(width: 40, height: 50)

                                VStack(alignment: .leading) {
                                    Text("Idioma do Aplicativo")
                                        .font(.title3)
                                        .foregroundColor(.blue)

                                    Text("Português (Brasil)")
                                        .font(.footnote)
                                }
                            }
                        }

                        NavigationLink(destination: Text("Ajuda / Suporte")) {
                            HStack {
                                Image(systemName: "questionmark.bubble")
                                    .foregroundColor(.blue)
                                    .font(.title)
                                    .frame(width: 40, height: 50)

                                Spacer()
                                    .frame(width: 9)

                                VStack(alignment: .leading) {
                                    Text("Ajuda / Suporte")
                                        .font(.title3)
                                        .foregroundColor(.blue)

                                    Text("Dúvidas, Contato e Sugestões")
                                        .font(.footnote)
                                }
                            }
                        }

                        NavigationLink(destination: Text("Sobre")) {
                            HStack {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.blue)
                                    .font(.title)
                                    .frame(width: 40, height: 50)

                                Spacer()
                                    .frame(width: 9)

                                VStack(alignment: .leading) {
                                    Text("Sobre")
                                        .font(.title3)
                                        .foregroundColor(.blue)

                                    Text("Quem somos, Proposta do App")
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
