//
//  ViewController.swift
//  FilmFest
//
//  Created by Ashika H on 30/01/21.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataService 
        self.libraryTableView.delegate = dataService
                
        movieManager.addMovie(movie: Movie(title: "Action Movie",releaseDate: "1999"))
        movieManager.addMovie(movie: Movie(title: "Action comedy"))
        movieManager.addMovie(movie: Movie(title: "indie Movie", releaseDate: "1989"))
        movieManager.addMovie(movie: Movie(title: "love story", releaseDate: "2010"))
        dataService.movieManager = movieManager
        
        libraryTableView.reloadData()

    }


}

