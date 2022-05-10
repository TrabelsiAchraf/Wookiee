//
//  MoviesViewModelTests.swift
//  WookieeTests
//
//  Created by Achraf Trabelsi on 09/05/2022.
//

import XCTest
@testable import Wookiee

class MoviesViewModelTests: XCTestCase {

    func test_loadView_whenServiceReturnSuccessWithData_thenWeHaveMovieList() {
        let mockFetchMoviesUseCase = MockFetchMoviesUseCase()
        let sut = DefaultMoviesViewModel(fetchMoviesUseCase: mockFetchMoviesUseCase)
        
        mockFetchMoviesUseCase.expectation = expectation(description: "Wait for fetch movies load")
        sut.loadView()
        
        waitForExpectations(timeout: 1.0)
        XCTAssertTrue(sut.movies.count > 0, "Expected movies count to be > 0, got \(sut.movies.count) instead")
    }
    
    func test_loadView_whenServiceReturnSuccessWithData_thenWeHaveMovieCategories() {
        let mockFetchMoviesUseCase = MockFetchMoviesUseCase()
        let sut = DefaultMoviesViewModel(fetchMoviesUseCase: mockFetchMoviesUseCase)
        
        mockFetchMoviesUseCase.expectation = expectation(description: "Wait for fetch movies load")
        sut.loadView()
        
        waitForExpectations(timeout: 1.0)
        XCTAssertTrue(sut.allCategories.count > 0, "Expected allCategories to be > 0, got \(sut.allCategories.count) instead")
    }
    
    func test_loadView_whenFetchingMovieByCategory_thenGetGoodMovieList() {
        let mockFetchMoviesUseCase = MockFetchMoviesUseCase()
        let sut = DefaultMoviesViewModel(fetchMoviesUseCase: mockFetchMoviesUseCase)
        
        mockFetchMoviesUseCase.expectation = expectation(description: "Wait for fetch movies load")
        sut.loadView()
        
        waitForExpectations(timeout: 1.0)
        let moviesByCategory = sut.movie(for: "Sci-Fi")
        XCTAssertEqual(moviesByCategory, [movie5, movie11], "Expected for \(movie5.title ?? "") and \(movie11.title ?? "") but got \(moviesByCategory)")
    }
}

final class MockFetchMoviesUseCase: FetchMoviesUseCase {
    var expectation: XCTestExpectation?
    func execute(completion: @escaping (Result<[FetchedMovie], Error>) -> Void) {
        completion(.success(fakeMovies))
        expectation?.fulfill()
    }
}
