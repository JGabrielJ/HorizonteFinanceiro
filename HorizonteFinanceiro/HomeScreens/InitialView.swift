//
//  InitialView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 27/10/22.
//

import SwiftUI


struct InitialView: View {
    var body: some View {
        Color(.white)

        Button {
            print("Indo para as Configurações...")
        } label: {
            Image("gear")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
