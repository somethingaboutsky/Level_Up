//
//  UIFunctions.swift
//  Level_Up
//
//  Created by Vincenzo Fardella on 01/12/24.
//

public class UIFunctions {
    
    func visiblePages(totalPages: Int, currentPage: Int) -> [Int] {
        let maxVisible = 5
        
        // Se il numero totale di pagine è minore o uguale al massimo visibile
        if totalPages <= maxVisible {
            return Array(0..<totalPages)
        }
        
        // Se il numero totale supera il massimo visibile
        let middleIndex = maxVisible / 2
        let startIndex = max(0, min(currentPage - middleIndex, totalPages - maxVisible))
        let endIndex = min(startIndex + maxVisible, totalPages)
        
        return Array(startIndex..<endIndex)
    }
}


