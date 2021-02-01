//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Ashika H on 31/01/21.
//

import XCTest
@testable import FilmFest

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    
    let sciFiMovie = Movie(title: "Sci-fi")
    let artHouse = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")
    
    override func setUp() {
        super.setUp()
        sut = MovieManager()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: sciFiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex() {
        sut.addMovie(movie: artHouse)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        
        XCTAssertEqual(artHouse.title, movieQueried.title)
    }
    
    // MARK: Checking Off
    func testCheckOffMovie_UpdateMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: artHouse)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, artHouse.title)
    }
    
    func testCheckOffMovie_ReturnMovieAtIndex() {
        sut.addMovie(movie: sciFiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sciFiMovie.title, movieQueried.title)
    }
    
    
    // MARK: Equatable
    func testEquatable_ReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsFalseForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action1")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsFalseForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1990")
        let actionMovie2 = Movie(title: "Action", releaseDate: "2001")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testClearArrays_ReturnsArrayCountZero() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: sciFiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
