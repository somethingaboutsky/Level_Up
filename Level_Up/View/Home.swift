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
            Image(.acLogo)
                .resizable()
                .frame(width: 64, height: 64)
                .frame(maxWidth: .infinity, alignment: .center)
            
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    // Game series carousel
                    ScrollView(.horizontal) {
                        LazyHStack (alignment: .top, spacing: 16) {
                            ForEach(0..<5) { i in
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(Color(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0))
                                    .frame(width: 352, height: 512)
                                    .overlay(VStack(alignment: .center) {
                                        Image(.acLogo)
                                            .resizable()
                                            .frame(width: 352, height: 352)
                                            .shadow(color: Color(red:212.0/255.0, green: 71.0/255.0, blue: 236.0/255.0), radius: 24, x: 0, y: 0)
                                        Text("Assassin's creed \(i+1)")
                                            .font(.system(size: 28, weight: .semibold))
                                            .padding(.vertical, 10)
                                        Text("Release Year \(i+1)")
                                    })
                                
                            }
                        }
                       
                    }
                    .padding(.horizontal)
                    .padding(.top, 64)
                    .scrollClipDisabled(true)
                    .scrollTargetBehavior(.paging)
                    
                    // Related Media
                    Text("Related Movies")
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.leading, 10)
                    ScrollView(.horizontal) {
                        
                    }
                    Text("Related TV Shows")
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.leading, 10)
                    ScrollView(.horizontal) {
                        
                    }
                    Text("Related Books")
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.leading, 10)
                    ScrollView(.horizontal) {
                        
                    }
                }
            }
            
            .scrollTargetBehavior(.paging)
        }
        .background(.black)
        .foregroundColor(.white)
    }
}

#Preview {
    Home()
}
