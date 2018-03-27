//
//  Movie.swift
//  TopMovies
//
//  Created by Assumani, Medi on 3/27/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Movie{
    let name: String
    let rightsOwner: String
    let price: Double
    let link: String
    let releaseDate: String
    
    init(json: JSON){
        
        let jsonData = JSON(json)
        self.name = jsonData["im:name"]["label"].stringValue
        self.rightsOwner = jsonData["rights"]["label"].stringValue
        self.price = (jsonData["im:price"]["label"] as? Double)!
        self.link = jsonData["link"]["attributes"]["href"].stringValue
        self.releaseDate = jsonData["im:releaseDate"]["attributes"]["label"].stringValue
        
    }
}
