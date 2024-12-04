import SwiftUI

struct CharactersView: View {
    @Binding var characters: [Characters]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Lista personaggi")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                    ForEach(0..<characters.count, id: \.self) { index in
                        
                        let character = characters[index]
                        
                        NavigationLink(destination: CharacterDetailView(character: .constant(character))) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 150, height: 240)
                                        
                                    Image(character.characterImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 240)

                                }
                                .foregroundColor(.black.opacity(0.5))

                                .background(Color(hex: 0x2b2b2b).opacity(0.5))
                                .cornerRadius(12)
                                .shadow(color: .accent, radius: 12, x: 0, y: 0)
                                
                                

                                
                                Text(character.name)
                                    .font(.system(size: 18, weight: .semibold))
                                    .padding(.top, 10)
                                    .foregroundColor(.white)
                            }
                            .padding(.top, 10)
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .padding(.top, 16)
    }
}

#Preview {
    CharactersView(characters: .constant([
        Characters(name: "Altair", characterImage: "Altair", desc: "Altair è bello e bravo"),
        Characters(name: "Al Mualim", characterImage: "Al_Mualim_ACR", desc: "Al Mualim è brutto e cattivo")
    ]))
}

