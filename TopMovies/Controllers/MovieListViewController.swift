//
//  MovieListViewController.swift
//  TopMovies
//
//  Created by Assumani, Medi on 4/4/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - @IBOULETS
    @IBOutlet weak var tableView: UITableView!
    var movieLists: [Movie] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieService.fetchMoviesWithAlamofire { (moviesFromAPI) in
            // Set the classes array of movies with
            self.movieLists = moviesFromAPI
            self.tableView.reloadData()
        }
        
        MovieService.fetchMoviesManually { (error, moviesFromAPI) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.movieLists = moviesFromAPI
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCellTableViewCell
        
        let movie = movieLists[indexPath.row]
        
        cell.movieNameLabel.text = movie.name
        cell.movieGenre.text = movie.genre
        
        return cell
    }
    
    // MARK: - SEGUE METHODS
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue){
        // leave empty for now
    }
 
}
