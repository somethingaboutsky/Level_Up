//
//  Functions.swift
//  Level_Up
//
//  Created by Gabriele Apicella on 28/11/24.
//

import Foundation
import UIKit

func storePreferences (userPrefs: UserPreferences) {
    do {
        let jsonData = try JSONEncoder().encode(userPrefs)
                
        if var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            url.appendPathComponent("preferences.json")
 
            try jsonData.write(to: url)
            print("Stored preferences")
        }
    } catch {
        print(error)
    }
}

func loadPreferences() -> UserPreferences? {
    let fileManager = FileManager.default
    guard let docDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
        print("Failed to locate document directory.")
        return nil
    }

    let inputFileURL = docDirectoryURL.appendingPathComponent("preferences.json")
    
    // Check if the file exists
    guard fileManager.fileExists(atPath: inputFileURL.path) else {
        print("Preferences file does not exist.")
        return nil
    }
    
    do {
        // Read the JSON data from the file
        let inputData = try Data(contentsOf: inputFileURL)
            
        let jsonDecoder = JSONDecoder()
        let userPrefs = try jsonDecoder.decode(UserPreferences.self, from: inputData)
        
        //print("Loaded preferences: \(userPrefs.favouriteGames)")

        return userPrefs
    } catch {
        print("Error reading JSON data: \(error)")
        return nil
    }
}


func updateUserPreferences(game: Game, isFavorite favorite: Bool) {
    // Se esiste un file delle preferenze
    if var userPreferences = loadPreferences() {
        // In base al valore di favorite si aggiunge o si rimuove l'ID dai preferiti
        if favorite {
            userPreferences.favouriteGames.append(game.id)
        } else {
            userPreferences.favouriteGames.removeAll { $0 == game.id }
        }
        print(userPreferences.favouriteGames)
        // Si rendono persistenti i cambiamenti
        storePreferences(userPrefs: userPreferences)
    }
}



func loadJSONFromBundle(named fileName: String) -> Data? {
    let paths = Bundle.main.paths(forResourcesOfType: ".json", inDirectory: nil)
    print("File JSON nel bundle:", paths)
    
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Errore durante il caricamento del file JSON: \(error)")
        }
    } else {
        print("File \(fileName) non trovato nel bundle.")
    }
    return nil
}


func parseJSONData<T: Decodable>(_ data: Data, to type: T.Type) -> T? {
    do {
        // Decodifica il JSON in una struttura Swift
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    } catch {
        print("Errore durante la decodifica del JSON: \(error)")
    }
    return nil
}


func createDefaultPath() -> URL {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    let docURL = URL(string: documentsDirectory)!
    let dataPath = docURL.appendingPathComponent("Level Up")
    if !FileManager.default.fileExists(atPath: dataPath.path) {
        do {
            try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    return dataPath
}


func getDocumentsDirectory() -> URL {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    let docURL = URL(string: documentsDirectory)!
    let dataPath = docURL.appendingPathComponent("Level Up")
    
    return dataPath
}


func buildStringArray(prefix : String, count: Int, startWithZero: Bool) -> [String]{
    var arr : [String] = []
    if startWithZero == false {
        for index in 0..<count{
            var string = prefix + String(index)
            arr.append(string)
        
        }
        return arr
    } else {
        for index in 0..<count {
            var string = ""
            
            switch index {
            case 0..<10:
                string = prefix + "00" + String(index)
            case 10..<100:
                string = prefix + "0" + String(index)
            default:
                string = prefix + String(index)
            }
            
            arr.append(string)
        }
        
        return arr
        
    }
    
}





