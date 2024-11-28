//
//  Game.swift
//  Try
//
//  Created by Gabriele Apicella on 28/11/24.
//

import Foundation

struct Game: Codable , Identifiable{
    var id = UUID()
    var title: String
    var gameImage: URL
    var releaseYear: Int
    var platform: String
    var recAge: Int
    var favourite: Bool
    var characters: [Characters] = []
    var books: [Books] = []
    var films: [Films] = []
    var guide: [Guide] = []
}
