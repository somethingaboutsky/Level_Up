//
//  Books.swift
//  Try
//
//  Created by Gabriele Apicella on 28/11/24.
//

import Foundation

struct Book: Codable {
    var id: Int
    var title: String
    var cover: String
    var releaseYear: Int
    var synopsis: String
}
