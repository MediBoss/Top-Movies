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

typealias  MovieJSON = [String: Any] // Dictionary where the JSON data will be stored
struct MoviService {
    
    
    static func fetchMoviesWithAlamofire(completion: @escaping ([Movie]) -> ()){
        
        
        var movieLists: [Movie] = []
        
        //using Alamofire to make HTTP Requests to itunes API and returns a response in JSON
        Alamofire.request(Constants.itunesUrl).responseJSON { (response) in
            
            // casts the response into swifty json objec
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
    
    static func fetchMoviesManually(completionHandler: @escaping (Error?,[Movie]) -> ()){
        
        var movieLists: [Movie] = []

        let baseUnwrappedUrl = URL(string: Constants.itunesUrl) // URL Object
        
        // making sure that an url was returned after creating an URL Object
        guard let baseUrl = baseUnwrappedUrl else {return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: baseUrl) { (data, response, error) in
            if error != nil {
                return completionHandler(error,[])
            }
            guard let unWrappedJsonData = data else {return}
            
            do{
                // JSONSerialization is the same as doing "JSON(data)" with SwiftyJSON
                if let jsonData = try? JSONSerialization.jsonObject(with: unWrappedJsonData) as! MovieJSON{
                    
                    guard let feedJsonKey = jsonData["feed"] as? MovieJSON, let movieEntries = feedJsonKey["entry"] as? [MovieJSON] else {return}
                    for movie in movieEntries {
                        if let movie = Movie(json: movie){
                            movieLists.append(movie)
                        }
                    }
                }
            }
            // Since Netwoking is done on a different thread, this line puts it on the main thread
            DispatchQueue.main.async {
                completionHandler(nil, movieLists)
            }
            // resuming the task at the end of URLSession for it to run
        }.resume()
        
        
    }
    
}
