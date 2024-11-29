//
//  ContentView.swift
//  Level_Up
//
//  Created by Gabriele Apicella on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var userPrefs = UserPreferences(favouriteGames: [32, 53])
    @State var result: String = ""
    
    init(){
        storePreferences(userPrefs: userPrefs)
    }
    
    var body: some View {
        VStack {
            Label("Se funziona la lettura dati qua sotto devi vedere roba, altrimenti piango", systemImage: "arrow.2.circlepath.circle")
            TextField("", text: $result)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .padding()
                   }
                   .onAppear {
                       // Load preferences when the view appears
                       if let loadedResult = loadPreferences() {
                           result = loadedResult
                       } else {
                           result = "No preferences found."
                       }
                   }
               }
        }

#Preview {
    ContentView()
}
