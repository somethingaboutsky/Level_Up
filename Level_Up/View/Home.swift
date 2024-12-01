//
//  Home.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 29/11/24.
//

import SwiftUI

struct Home: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    
    @State private var currentGame = 0
    
    var body: some View {
        ZStack (alignment: .top) {
            HStack {
                Spacer()
                Image(.acLogo)
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
    Home()
}
