//
//  ShowMovieViewController.swift
//  TopMovies
//
//  Created by Assumani, Medi on 3/25/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

class ShowMovieViewController: UIViewController {
    
    // - MARK : @IBOUTLETS
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var rightsOfOwnerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var moviePosterView: UIImageView!
    
    
    

    // - MAKR : @IBACTIONS

    @IBAction func ituneLinkButtonIsTaped(_ sender: Any) {
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

