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
                NavigationLink(destination: InitialView(), label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                })
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
