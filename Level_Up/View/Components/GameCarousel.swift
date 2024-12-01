//
//  ContentCarousel.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 29/11/24.
//

import SwiftUI

struct GameCarousel: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let uif = UIFunctions()
    
    @State private var currentPage: Int = 0
    
    @Binding var games: [Game]
    
    var body: some View {

        VStack {
            TabView (selection: $currentPage) {
                ForEach($games, id: \.id) { game in
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0))
                        .frame(width: 360, height: 600)
                        .overlay(VStack(alignment: .center) {
                            Image(ImageResource(name: game.cover.wrappedValue, bundle: Bundle.main))
                                .resizable()
                                .frame(width: 300, height: 420)
                                .shadow(color: .accentColor, radius: 12, x: 0, y: 0)
                            Text(game.title.wrappedValue)
                                .font(.system(size: 36, weight: .semibold))
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                            Text(String(game.releaseYear.wrappedValue))
                                .font(.system(size: 22, weight: .light))
                        })
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                        .padding(.horizontal, 10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Custom page control
            HStack(spacing: 8) {
                ForEach(uif.visiblePages(totalPages: games.count, currentPage: currentPage), id: \.self) { page in
                    Circle()
                        .fill(page == currentPage ? .accentColor : Color.gray)
                        .frame(width: 10, height: 10)
                        .animation(.easeInOut, value: currentPage)
                }
            }
            .padding()
        }
        .padding()
        .frame(width: screenWidth, height: screenHeight - 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    GameCarousel(games: .constant([Game(id: 0, title: "Assassin's Creed", cover: "Assassins_ Creed", releaseYear: 2007, platform: ["PS3", "XBOX 360", "PC"], recAge: 18, favourite: false, characters: []), Game(id: 1, title: "Assassin's Creed 2", cover: "Assassins_Creed_2", releaseYear: 2009, platform: ["PS3", "XBOX 360", "PC"], recAge: 18, favourite: false, characters: [])]))
}
