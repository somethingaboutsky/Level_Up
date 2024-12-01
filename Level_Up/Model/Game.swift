//
//  Game.swift
//  Try
//
//  Created by Gabriele Apicella on 28/11/24.
//

import Foundation

struct Game: Codable , Identifiable{
    var id: Int
    var title: String
    var cover: URL
    var releaseYear: Int
    var platform: [String]
    var recAge: Int
    var favourite: Bool
    var characters: [Characters]
}
