//
//  ProfileView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 22/11/22.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: ChangeNameView()) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.blue)
                            .font(.title)
                            .frame(width: 40)
                            .padding(4)
                        
                        VStack(alignment: .leading) {
                            Text("Alterar Nome de Usuário")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
                }

                NavigationLink(destination: NotificationView()) {
                    HStack {
                        Image(systemName: "bell")
                            .foregroundColor(.blue)
                            .font(.title)
                            .frame(width: 40)
                            .padding(4)
                        
                        VStack(alignment: .leading) {
                            Text("Notificações")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
                }

                NavigationLink(destination: Text("Alterar Senha")) {
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.blue)
                            .font(.title)
                            .frame(width: 40)
                            .padding(4)
                        
                        VStack(alignment: .leading) {
                            Text("Alterar Senha")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct ChangeNameView: View {
    @State var msg = ""
    @State var username = ""

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center) {
                Text("Alterar Nome de Usuário")
                    .font(.title3)
                    .bold()

                TextField("Digite o novo nome...", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 40)
                
                Text(msg)

                Button {
                    msg = "Nome de Usuário alterado com sucesso!"
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .frame(width: 250, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.blue, lineWidth: 3)
                            )

                        Text("Alterar Nome")
                            .foregroundColor(.black)
                    }
                }

                Spacer()
                    .frame(height: 100)
            }
        }
    }
}

struct NotificationView: View {
    @State var isOn: Bool = false
    @State var isOn2: Bool = false
    @State var isOn3: Bool = false

    var body: some View {
        Form {
            HStack {
                Toggle("Notificações em Geral", isOn: $isOn)
            }

            HStack {
                Toggle("Lembretes de Atividades", isOn: $isOn2)
            }

            HStack {
                Toggle("Notificações de Conteúdos", isOn: $isOn3)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
