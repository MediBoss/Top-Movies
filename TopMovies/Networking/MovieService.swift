//
//  MovieService.swift
//  TopMovies
//
//  Created by Assumani, Medi on 4/4/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct MoviService {
    
    
    static func fetchMovies(completion: @escaping ([Movie]) -> ()){
        
        
        var movieLists: [Movie] = []
        
        //using Alamofire to make HTTP Requests to itunes API and returns a response in JSON
        Alamofire.request(Constants.itunesUrl).responseJSON { (response) in
            
            // casts the response into swifty json object
            var jsonData = JSON(response.data as Any)
            // goes into the "feed" key, then "entry" key to get the list of all movies
            let feedJsonKey = jsonData["feed"]["entry"].arrayValue
            
            for movie in feedJsonKey {
                if let newMovie = Movie(json: movie){
                    movieLists.append(newMovie)
                }
                
            }
           completion(movieLists) // completes with movielists
        }
        
    }
}
