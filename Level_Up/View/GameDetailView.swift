//
//  GameDetailView.swift
//  LevelUp
//
//  Created by Ilenia Munfuletto on 29/11/24.
//

import SwiftUI

struct ChosenSectionView : View {
   
    var selectedSection: Section
    
    @Binding var game: Game
    
    var body: some View {
        switch selectedSection {
        case .overview:
            GameDetailOverview(selectedSection: selectedSection, game: $game)
        case .story:
            GameDetailStory()
        case .characters:
            let _ = print("characters")
        case .guides:
            let _ = print("guides")
        }
    }
}


struct GameMainView : View {
    @State  var selectedSection: Section = .overview
    @Binding var game: Game
    
    let img_logo = ImageResource(name: "ACLogo", bundle: .main)
    
    var body: some View {
        VStack(alignment: .center) {
            PickerSegmentedControl(selectedSection: $selectedSection)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image(img_logo)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
        }
        .preferredColorScheme(.dark)
        
        ChosenSectionView(selectedSection: selectedSection, game: $game)
    }
}



struct GameDetailOverview: View {
    var selectedSection: Section
    
    @Binding var game: Game
    
    @State var userPreferences: UserPreferences = loadPreferences()!
    
    var body: some View {
        Rectangle()
            .cornerRadius(32)
            .foregroundColor(Color(hex: 0x2b2b2b))
            .position(x:160, y:300)
            .frame(width: 320, height: 600)
            .overlay(
                VStack {
                    Image(ImageResource(name: game.cover, bundle: .main))
                        .resizable()
                        .frame(width: 240, height: 320)
                        .shadow(color: .purple, radius: 12, x: 0, y: 0)
                    Text(game.title)
                        .font(.system(size: 28, weight: .bold))
                        .padding(.vertical, 20)
                    Button (action: {
                        game.favourite = !game.favourite
                        updateUserPreferences(game: game, isFavorite: game.favourite)
                    }) {
                        Image(systemName: game.favourite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding()
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(50)
                    }
                        
                })
            .onAppear {
                userPreferences = loadPreferences()!
                if userPreferences.favouriteGames.contains(game.id) {
                    game.favourite = true
                }
            }
    }
       
}




struct GameDetailStory: View {
    var body: some View {
        Text("Story")
        Spacer()
    }
    
}


enum Section : String, CaseIterable {
    case overview = "Overview"
    case story = "Story"
    case characters = "Characters"
    case guides = "Guides"
}


extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

    

#Preview {
    GameMainView(selectedSection: .overview, game: .constant(Game(id: 0, title: "Assassin's Creed", cover: "Assassins_ Creed", releaseYear: 2007, platform: ["PC", "XBOX 360", "PS3"], recAge: 18, favourite: false, characters: [])))
}

