//
//  Home.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 29/11/24.
//

import SwiftUI

struct Home: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State private var currentGame = 0
    @Binding var gameSeries: GameSeries
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .top) {
                HStack {
                    Spacer()
                    Image(ImageResource(name: gameSeries.seriesImage, bundle: Bundle.main))
                        .resizable()
                        .frame(width: 64, height: 64)
                    Spacer()
                }
                .background(.black)
                .zIndex(1)
                
                VStack(spacing: 0) {
                    ScrollView(.vertical) {
                        VStack (spacing: 0) {
                            // Game series carousel
                            GameCarousel(games: $gameSeries.games)
                            // Related Media Carousels
                            if gameSeries.films.count > 0 {
                                MoviesCarousel(films: $gameSeries.films)
                            }
                            /*if gameSeries.tvShows.count > 0 {
                                TVShowsCarousel()
                            }*/
                            if gameSeries.books.count > 0 {
                                BooksCarousel(bookCollection: $gameSeries.books)
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Home(gameSeries: .constant(GameSeries(
        name: "Assassin's Creed", seriesImage: "ACLogo", desc: "An iconic series exploring the eternal struggle between Assassins and Templars through history.", games: [Game(id: 0, title: "Assassin's Creed", cover: "Assassins_ Creed", releaseYear: 2007, platform: ["PS3", "XBOX 360", "PC"], recAge: 18, favourite: false, characters: []), Game(id: 1, title: "Assassin's Creed 2", cover: "Assassins_Creed_2", releaseYear: 2009, platform: ["PS3", "XBOX 360", "PC"], recAge: 18, favourite: false, characters: [])], films: [Movie(id: 0, title: "Assassin's Creed", cover: "ac_movie", releaseYear: 2016)])))
}
