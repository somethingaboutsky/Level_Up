//
//  TVShows.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 30/11/24.
//

import SwiftUI

struct TVShowsCarousel: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let totalPages = 6
    
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            Text("Related TV Shows")
                .font(.system(size: 28, weight: .semibold))
                .padding(.leading, 10)
                .padding(.bottom, 0)
            TabView (selection: $currentPage) {
                ForEach(0..<totalPages) { i in
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0))
                        .frame(width: screenWidth * 0.8, height: screenHeight * 0.5858124)
                        .overlay(VStack(alignment: .center) {
                            Image(.acLogo)
                                .resizable()
                                .frame(width: screenWidth * 0.8756219, height: screenHeight * 0.40274599542334094)
                                .shadow(color: Color(red:212.0/255.0, green: 71.0/255.0, blue: 236.0/255.0), radius: 24, x: 0, y: 0)
                            Text("Assassin's Creed TV Show \(i+1)")
                                .font(.system(size: 28, weight: .semibold))
                                .padding(.vertical, 10)
                            Text("Release Year \(i+1)")
                        })
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                        .padding(.horizontal, 10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Custom page control
            HStack(spacing: 8) {
                ForEach(0..<totalPages, id: \.self) { page in
                    Circle()
                        .fill(page == currentPage ? .accentColor : Color.gray)
                        .frame(width: 10, height: 10)
                        .animation(.easeInOut, value: currentPage)
                }
            }
            .padding()
        }
        .frame(width: screenWidth, height: screenHeight * 0.8)
    }
}

#Preview {
    TVShowsCarousel()
}
