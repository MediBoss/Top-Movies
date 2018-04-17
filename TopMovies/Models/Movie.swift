//
//  Movie.swift
//  TopMovies
//
//  Created by Assumani, Medi on 3/27/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

struct Movie {
    
    var name: String?
    var rightsOwner: String?
    var price: Double?
    var link: String?
    var releaseDate: String?
    var genre: String?
    var poster: UIImage?
    
    // default initializer
    init(name: String, rights: String, price: Double, link: String, releaseDate: String, genre: String, poster: UIImage){
        
        self.name = name
        self.rightsOwner = rights
        self.price = price
        self.link = link
        self.releaseDate = releaseDate
        self.genre = genre
        self.poster = poster
    }
}



