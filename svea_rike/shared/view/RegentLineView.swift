//
//  RegentLineView.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2021-01-10.
//

import SwiftUI

struct RegentLineView: View {
    
    @ObservedObject var turn: Turn
    
    var body: some View {
        HStack {
            ForEach(Regent.all, id: \.self) { regent in
                
                Circle()
                    .modifier(SelectedModifyer(selected: regent == turn.regent))
                    .foregroundColor(regent.era.primaryColor)
                    .overlay(
                        VStack {
                            if regent == turn.regent {
                                InfoBox(regent: turn.regent, condition: turn.specialCondition)
                            }
                        }
                    )
            }
        }
    }
    
    struct InfoBox: View {
        let regent: Regent
        let condition: RegentSpecialCondition
        
        var body: some View {
            VStack {
                Text(regent.name).font(.callout).fixedSize()
                Text(condition.display).fixedSize().font(.body)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 2))
            .overlay(Image(systemName: "chevron.up").font(.headline).frame(maxHeight: .infinity, alignment: .top).offset(y: -16))
            .offset(y: 70)
            .foregroundColor(regent.era.primaryColor)
        }
    }
}

extension RegentLineView {
    struct SelectedModifyer: ViewModifier {
        let selected: Bool
        
        func body(content: Content) -> some View {
            ZStack {
                content
                
                if !selected {
                    Circle()
                        .strokeBorder(lineWidth: 10)
                        .foregroundColor(.white)
                    
                    Circle().strokeBorder(lineWidth: 2)
                }
            }
        }
    }
}

struct RegentLineView_Previews: PreviewProvider {
    static var previews: some View {
        RegentLineView(turn: GameEngine.createGame(playerNames: ["Kalle", "Evelina", "Ivar"]).turn)
            .frame(height: 30)
    }
}
