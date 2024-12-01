//
//  DataLoader.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 01/12/24.
//

import Foundation
import UIKit

class DataLoader {
    
    @Published var gameSeries : GameSeries?
    
    init() {
        load()
    }
    
    func load() {
        if let asset = NSDataAsset.init(name: "db") {
            let data = asset.data
            do {
                let decodedData = try JSONDecoder().decode(GameSeries.self, from: data)
                gameSeries = decodedData
            } catch {
                print(error.localizedDescription)
                print(error)
            }
        } else {
            print("Nessun asset chiamato \"db\"")
        }
    }
}
