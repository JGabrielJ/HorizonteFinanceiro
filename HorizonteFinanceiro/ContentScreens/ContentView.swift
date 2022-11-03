//
//  ContentView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 01/11/22.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        Text("Tela Inicial")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Educação Financeira e Seus Aspectos")
                    .bold()
                    .font(.title)
                    .frame(width: 400, height: 200, alignment: .center)
                    .multilineTextAlignment(.center)
                    .navigationBarTitleDisplayMode(.inline)
                    
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .frame(width: 400, height: 400, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.blue, lineWidth: 3)
                    )

                Spacer()

                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            NavigationLink(destination: HomeView(), label: {
                                Image(systemName: "arrow.right.square")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48, alignment: .center)
                            })
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
