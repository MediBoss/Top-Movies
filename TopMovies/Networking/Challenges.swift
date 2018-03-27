//
//  Challenges.swift
//  TopMovies
//
//  Created by Assumani, Medi on 3/27/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import SwiftyJSON


internal func exerciseTwo(){
    
    
    
}

/*
internal func exerciseThree(){
    guard let jsonURL = Bundle.main.url(forResource: "iTunes-Movies", withExtension: "json") else {
        print("Could not find iTunes-Movies.json")
        return
    }
    
    do{
            // initializes a data content that contains the JSON data from the iTunes-TopMovies file
        let jsonData = try Data(contentsOf: jsonURL)
            // creates a new JSON object with all the JSON data
        let moviesData = try JSON(data: jsonData)
            // This statement grabs an array of JSON objects that represents each movie
        let allMoviesData = moviesData["feed"]["entry"].arrayValue
        
        var allMovies : [Movie] = []
        
        for movie in 0...allMoviesData.count{
            
        }
        
        
    }catch {
        print("Could not load data ")
    }
    
        
    
}
*/
