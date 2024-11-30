//
//  Level_UpApp.swift
//  Level_Up
//
//  Created by Gabriele Apicella on 28/11/24.
//

import SwiftUI

@main
struct Level_UpApp: App {
        
    var body: some Scene {
        let path = createDefaultPath()
        let _ = print(path.relativePath)
        
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
    
}
