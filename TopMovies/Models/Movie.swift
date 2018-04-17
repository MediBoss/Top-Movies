//
//  Movie.swift
//  TopMovies
//
//  Created by Assumani, Medi on 3/27/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

struct Movie: Decodable {
    
    var name: String?
    var rightsOwner: String?
    var price: Double?
    var link: String?
    var releaseDate: String?
    var genre: String?
    var poster: UIImage?
    
    // optional initializer
    init?(name: String, rights: String, price: Double, link: String, releaseDate: String, genre: String, poster: UIImage){
        
        self.name = name
        self.rightsOwner = rights
        self.price = price
        self.link = link
        self.releaseDate = releaseDate
        self.genre = genre
        self.poster = poster
    }
    
    init(from decoder: Decoder) throws {
        let movieContainer = try decoder.container(keyedBy: JSONKeys.self)
        let movieName: String = try movieContainer.decode(String.self, forKey: .name)
        let movieRightsOfOwner = try movieContainer.decode(String.self, forKey: .rightsOfOwner)
        let moviePrice = try movieContainer.decode(String.self, forKey: .price)
        let movieLink = try movieContainer.decode(String.self, forKey: .link)
        let movieReleaseData = try movieContainer.decode(String.self, forKey: .releaseDate)
        let movieGenre = try movieContainer.decode(String.self, forKey: .genre)
        let moviePoster = try movieContainer.decode(String.self, forKey: .poster)
    }
}
