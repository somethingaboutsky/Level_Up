//
//  GameSeries.swift
//  Try
//
//  Created by Gabriele Apicella on 28/11/24.
//

import Foundation

struct GameSeries: Codable{
    var name: String
    var seriesImage: String
    var desc: String
    var games: [Game] = []
    var books: [Book] = []
    var films: [Movie] = []
    var guides: [Guide] = []
}
