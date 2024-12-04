//
//  ContentView.swift
//  Level_Up
//
//  Created by Gabriele Apicella & Vincenzo Fardella on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var userPrefs = UserPreferences(favouriteGames: [], firstTime: true)
    @State var result: String = ""
    @State var gameSeries = DataLoader().gameSeries!
    
    init(){
        let fileManager = FileManager.default
        
        let baseURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let preferencesURL = baseURL?.appendingPathComponent("preferences.json")
        
        if fileManager.fileExists(atPath: preferencesURL!.path) {
            userPrefs = loadPreferences()!
        } else {
            storePreferences(userPrefs: userPrefs)
        }
    }
    
    var body: some View {
        Home(gameSeries: $gameSeries)
    }
}


#Preview {
    ContentView()
}
