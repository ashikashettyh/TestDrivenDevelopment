//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Ashika H on 31/01/21.
//

import XCTest
@testable import FilmFest

class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockdataSource: MockCellDataSource!
    
    override func setUp() {
        super.setUp()
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        tableView = libraryVC.libraryTableView
        mockdataSource = MockCellDataSource()
        tableView.dataSource = mockdataSource
    }

    func testCell_Config_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Indie Comedy", releaseDate: "2018"))
        
        XCTAssertEqual(cell.textLabel?.text, "Indie Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }
    
}
