//
//  ActivitiesView.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 11/11/22.
//

import SwiftUI


struct ActivitiesView: View {
    
    var body: some View {
        VStack {
            Text("Agora vamos por em prática o que aprendemos")
                .bold()
                .padding()
                .font(.title)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding()


                
            }
            
            ZStack {
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .frame(width: 250, height: 50)
                }
            }
        }
    }

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
