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
    let name: String?
    let rightsOwner: String?
    let price: Double?
    let link: String?
    let releaseDate: String?
    let genre: String?
    
    init?(json: Any){
        //checks if the json data passed s of type JSON
        if json is JSON{
            let json = JSON(json)
            guard let title = json["im:name"]["label"].string,
                let rights = json["rights"]["label"].string,
                let price = json["im:price"]["label"].double,
                let link = json["link"]["href"].string,
                let releaseDate = json["im:releaseDate"]["attributes"]["label"].string,
                let genre = json["category"]["attributes"]["term"].string else {return nil}
            
            self.name = title
            self.rightsOwner = rights
            self.price = price
            self.link = link
            self.releaseDate = releaseDate
            self.genre = genre
            
        }else{
            // if the object data passed is not of type JSON, nothing is created
            return nil
        }
    }
}
