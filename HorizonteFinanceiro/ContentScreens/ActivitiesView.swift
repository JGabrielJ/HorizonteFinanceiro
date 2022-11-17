//
//  ActivitiesView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 11/11/22.
//

import SwiftUI


struct ActivitiesView: View {
    var body: some View {
        Text("Agora vamos por em prática o que aprendemos")
            .bold()
            .font(.largeTitle)
            .foregroundColor(.blue)
            .multilineTextAlignment(.center)
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
