//
//  Movie.swift
//  FilmFest
//
//  Created by Ashika H on 31/01/21.
//

import Foundation

struct Movie : Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = "nil") {
        self.title = title
        self.releaseDate = releaseDate
    }
}


//func==(lhs: Movie, rhs: Movie) -> Bool {
//    return true
//}
