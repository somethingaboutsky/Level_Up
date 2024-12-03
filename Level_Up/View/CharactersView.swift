//
//  CharactersView.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 02/12/24.
//

import SwiftUI

struct CharactersView: View {
    @Binding var characters: [Characters]
    
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text("Lista personaggi")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                    ForEach(characters, id: \.id) { character in
                        VStack {
                            RoundedRectangle(cornerRadius: CGFloat(16))
                                .frame(width: 150, height: 240)
                                .background(Color(hex: 0x2b2b2b))
                                .shadow(color: .accent, radius: 12, x: 0, y: 0)
                                .overlay(content: {
                                    Image(ImageResource(name: character.characterImage, bundle: .main))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 300)
                                        .position(x: 90, y: 290)
                                        .cornerRadius(16)
                                })
                            Text(character.name)
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.top, 10)
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
    }
}

#Preview {
    CharactersView(characters: .constant([Characters(id: 0, name: "Altair", characterImage: "Altair", desc: "Altair è bello e bravo"), Characters(id: 1, name: "Al Mualim", characterImage: "Al_Mualim_ACR", desc: "Al Mualim è brutto e cattivo")]))
}
