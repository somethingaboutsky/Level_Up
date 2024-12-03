//
//  MoviesCarousel.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 29/11/24.
//

import SwiftUI

struct MoviesCarousel: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height    
    let uif = UIFunctions()
    
    @State private var currentPage: Int = 0
    @Binding var films: [Movie]
    
    var body: some View {
        VStack (spacing: 0) {
            HStack {
                Text("Film Correlati")
                    .font(.system(size: 28, weight: .semibold))
                    .padding(.top, 70)
                Spacer()
            }
            .padding(.leading, 10)
            
            TabView (selection: $currentPage) {
                ForEach($films, id: \.id) { film in
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0))
                        .frame(width: 360, height: 600)
                        .overlay(VStack(alignment: .center) {
                            Image(ImageResource(name: film.cover.wrappedValue, bundle: Bundle.main))
                                .resizable()
                                .frame(width: 300, height: 420)
                                .shadow(color: .accentColor, radius: 12, x: 0, y: 0)
                            Text(film.title.wrappedValue)
                                .font(.system(size: 36, weight: .semibold))
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                            Text(String(film.releaseYear.wrappedValue))
                                .font(.system(size: 22, weight: .light))
                        })
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                        .padding(.horizontal, 15)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            Spacer()
            // Custom page control
            HStack(spacing: 8) {
                ForEach(uif.visiblePages(totalPages: films.count, currentPage: currentPage), id: \.self) { page in
                    Circle()
                        .fill(page == currentPage ? .accentColor : Color.gray)
                        .frame(width: 10, height: 10)
                        .animation(.easeInOut, value: currentPage)
                }
            }
            .padding()
        }
        .frame(width: screenWidth, height: screenHeight - 80)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MoviesCarousel(films: .constant([Movie(id: 1, title: "Assassin's Creed", cover: "ac_movie", releaseYear: 2016,synopsys: "")]))
}
