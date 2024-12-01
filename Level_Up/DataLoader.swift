//
//  DataLoader.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 01/12/24.
//

import Foundation
import UIKit

class DataLoader {
    
    @Published var gameSeries = [GameSeries]()
    
    init() {
        load()
    }
    
    func load() {
        if let asset = NSDataAsset.init(name: "db") {
            let data = asset.data
            do {
                gameSeries = try JSONDecoder().decode([GameSeries].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Nessun asset chiamato \"db\"")
        }
        
        
        /*if let fileLocation = Bundle.main.url(forResource: "db", withExtension: "json") {
            do {
                print(fileLocation)
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                self.gameSeries = try decoder.decode([GameSeries].self, from: data)
                print(self.gameSeries)
            } catch {
                print(error)
            }
        } else {
            print("File ProvaDb.json non trovato")
        }*/
    }
}
