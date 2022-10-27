//
//  InitialView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 27/10/22.
//

import SwiftUI

// NavigationView e Toolbar

struct InitContent: View {
    var body: some View {
        Text("App Rende")
    }
}

struct InitialView: View {
    var body: some View {
        NavigationView {
            InitContent()
            .toolbar {
                Button {
                    print("Indo para as Configurações...")
                } label: {
                    Image("gear")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
