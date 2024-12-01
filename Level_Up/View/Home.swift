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
        ZStack (alignment: .top) {
            HStack {
                Spacer()
                
                AsyncImage(url: URL(string: gameSeries.seriesImage)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView() // Mostra un indicatore di caricamento
                                case .success(let image):
                                    image
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .foregroundColor(.gray) 
                                @unknown default:
                                    EmptyView()
                                }
                            }
                Spacer()
            }
            .background(.black)
            .zIndex(1)
            
            VStack(spacing: 0) {
                ScrollView(.vertical) {
                    VStack (spacing: 0) {
                        // Game series carousel
                        GameCarousel()
                        // Related Media Carousels
                        MoviesCarousel()
                        TVShowsCarousel()
                        BooksCarousel()
                    }
                }
                .scrollTargetBehavior(.paging)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Home(gameSeries: .constant(GameSeries(name: "Assassin's Creed", seriesImage: "acLogo", desc: "An iconic series exploring the eternal struggle between Assassins and Templars through history.")))
}
