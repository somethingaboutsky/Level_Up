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
            url.appendPathComponent("preferences.json")
 
            try jsonData.write(to: url)
        }
    } catch {
        print(error)
    }
}

func loadPreferences() -> String? {
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
        
        // Convert the data into a string
        let jsonString = String(data: inputData, encoding: .utf8)
        print(jsonString)
        return jsonString
    } catch {
        print("Error reading JSON data: \(error)")
        return nil
    }
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


