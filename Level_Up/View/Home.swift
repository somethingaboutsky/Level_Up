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

        VStack {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Spacer()
                        Image(.acLogo)
                            .resizable()
                            .frame(width: screenWidth * 0.1592, height: screenHeight * 0.073226)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                    }
                    .frame(height: screenHeight * 0.07780320366132723)
                    .background(Color.black.opacity(0.2))
                    .padding(.bottom, 0)
                    
                    ScrollView(.vertical) {
                        VStack {
                            // Game series carousel
                            GameCarousel()
                            // Related Media Carousels
                            MoviesCarousel()
                                .padding(.bottom, 10)
                            TVShowsCarousel()
                                .padding(.bottom, 10)
                            BooksCarousel()
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
                
                
            }
        }
        .background(.black)
        .foregroundColor(.white)
        
    }
}

#Preview {
    Home()
}
