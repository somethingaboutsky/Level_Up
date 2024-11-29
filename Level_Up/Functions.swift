//
//  Functions.swift
//  Level_Up
//
//  Created by Gabriele Apicella on 28/11/24.
//

import Foundation

func storePreferences (userPrefs: UserPreferences) {
    do {
        let jsonData = try JSONEncoder().encode(userPrefs)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        print(jsonString)
        
        if var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            url.appendPathComponent("Level Up")
            url.appendPathComponent("preferences.json")
 
            try jsonData.write(to: url)
        }
    } catch {
        print(error)
    }
}


func loadPreferences(jsonData: Data) -> UserPreferences? {
    do {
        let decodedPrefs = try JSONDecoder().decode(UserPreferences.self, from: jsonData)
        print(decodedPrefs)
        return decodedPrefs
    } catch {
        print(error)
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


