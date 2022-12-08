//
//  RadioButton.swift
//  HorizonteFinanceiro
//
//  Created by João Gabriel Jacinto da Silva on 08/12/22.
//

import SwiftUI


struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(.white)
    }
}

enum Options: String {
    case first = "\nPrimeira Opção \n"
    case second = "Segunda Opção"
    case third = "\nTerceira Opção \n"
}

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View {
        VStack {
            radioFirst
            radioSecond
            radioThird
        }
    }
    
    var radioFirst: some View {
        RadioButtonField(
            id: Options.first.rawValue,
            label: Options.first.rawValue,
            isMarked: selectedId == Options.first.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioSecond: some View {
        RadioButtonField(
            id: Options.second.rawValue,
            label: Options.second.rawValue,
            isMarked: selectedId == Options.second.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    var radioThird: some View {
        RadioButtonField(
            id: Options.third.rawValue,
            label: Options.third.rawValue,
            isMarked: selectedId == Options.third.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
