//
//  CharacterDetailView.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 03/12/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @Binding var character: Characters
    
    let img_logo = ImageResource(name: "ACLogo", bundle: .main)
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Text(character.name)
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
                
            Image(ImageResource(name: character.characterImage, bundle: .main))
                .resizable()
                .scaledToFit()
                .frame(height: 320)
            RoundedRectangle(cornerRadius: 32)
                .fill(Color(red: 43/255, green: 43/255, blue: 43/255))
                .overlay(ScrollView {
                    Text(LocalizedStringKey(character.desc))
                }.padding())
        }
        .preferredColorScheme(.dark)
        .padding()
        .frame(width: screenWidth, height: screenHeight - 120)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image(img_logo)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .padding(.vertical, 20)

            }
        }
            
    }
}

#Preview {
    CharacterDetailView(character: .constant(Characters(name: "Altaïr Ibn-La'Ahad", characterImage: "Altair", desc: "Altair Ibn-La'Ahad (in arabo: الطائر ابن لا أحد) è il protagonista \"del passato\".\nIl suo nome significa \"L'Uccello Figlio di Nessuno\", riflettendo sia il suo ruolo di Assassino, abile e libero come un uccello, sia il mistero attorno alle sue origini.\n\nEgli si presenta arrogante, impulsivo e spesso disobbedisce agli ordini, credendosi superiore agli altri.\nQuesto comportamento lo porta a fallire una missione cruciale, causando la morte di compagni e la perdita di una preziosa reliquia.\n\nTuttavia, nel corso della storia, Altair attraversa un percorso di crescita personale. Diventa più riflessivo, umile e capisce il vero significato del Credo degli Assassini: non uccidere per potere, ma per proteggere la libertà.\n\nLe abilità di Altair si suddividono in:\n- **Combattimento:** Altair è un maestro nell'uso delle armi, come la spada, i pugnali e la leggendaria lama celata (Hidden Blade). È anche un esperto nel combattimento corpo a corpo.\n- **Parkour:** La sua agilità gli permette di scalare edifici, muoversi rapidamente tra i tetti e sfuggire ai nemici.\n- **Infiltrazione:** Altair è un esperto nell’arte di confondersi tra la folla, spiare e infiltrarsi in aree sorvegliate.\n\nAnche se, per i videogiocatori della saga ha un piccolo deficit rispetto agli altri assassini: non sa nuotare, quindi, attenzione a non atterrare in acqua durante il parkour!\n\nC'è da dire che Altair rimane un personaggio centrale anche dopo il primo gioco per ben tre motivi:\n- **È lo Scrittore del Codice degli Assassini:** Riformula il Credo basandosi sulla sua esperienza.\n- **È lo Scopritore dei Segreti dei Precursori:** Durante la sua vita, studia i manufatti Isu, come i Frutti dell’Eden, e cerca di capire come proteggerli.\n- **La sua eredità:** I suoi insegnamenti influenzano generazioni future di Assassini, inclusi personaggi come Ezio Auditore.")))
}
