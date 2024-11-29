//
//  ContentView.swift
//  Level_Up
//
//  Created by Gabriele Apicella on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var userPrefs = UserPreferences(favouriteGames: [32, 53])
    
    init(){
        storePreferences(userPrefs: userPrefs)
    }
    
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
