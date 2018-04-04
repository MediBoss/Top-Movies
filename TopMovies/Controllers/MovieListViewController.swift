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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCellTableViewCell
        cell.movieNameLabel.text = "Movie Name"
        cell.movieGenre.text = "Genre"
        
        return cell
    }
    
    // MARK: - SEGUE METHODS
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue){
        // leave empty for now
    }
 
}