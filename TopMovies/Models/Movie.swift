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
    var name: String?
    var rightsOwner: String?
    var price: Double?
    var link: String?
    var releaseDate: String?
    var genre: String?
    
    init?(_ json: Any){
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
            
        }else if json is MovieJSON{
            if let json = json as? MovieJSON{
                
                
                        // CASTING THE VALUES RECEIVED FROM THE JSON DOCUMENT
                
                guard let titleNode = json["im:name"] as? MovieJSON,
                    let title = titleNode["label"] as? String,
                    let rightNode = json["rights"] as? MovieJSON,
                    let rights = rightNode["label"] as? String,
                    let priceNode = json["im:price"] as? MovieJSON,
                    let price = priceNode["label"] as? Double,
                    let linkNode = json["link"] as? MovieJSON,
                    let link = linkNode["href"] as? String,
                    let dateNodeoOne = json["im:releaseDate"] as? MovieJSON,
                    let dateNodeTwo = dateNodeoOne["attributes"] as? MovieJSON,
                    let date = dateNodeTwo["label"] as? String,
                    let genreNodeOne = json["category"] as? MovieJSON,
                    let genreNodeTwo = genreNodeOne["attributes"] as? MovieJSON,
                    let genre = genreNodeTwo["term"] as? String
                        else  {return nil}
                
                    // INITIALIZING STORED PROPERTIES
                
                self.name = title
                self.price = price
                self.rightsOwner = rights
                self.link = link
                self.releaseDate = date
                self.genre = genre
                
            }
            
        } else { // if neither JSON or MovieJSON
            return nil
        }
    }
}
