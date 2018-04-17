//
//  JSONKeys.swift
//  TopMovies
//
//  Created by Assumani, Medi on 4/16/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation

enum JSONKeys: String, CodingKey {
    case name = "im:name"
    case rightsOfOwner = "rights"
    case price = "im:price"
    case link = "link"
    case genre = "category"
    case poster = "im:image"
    case releaseDate = "im:releaseDate"
}
