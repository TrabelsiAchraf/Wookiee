//
//  FetchMoviesUseCaseTests.swift
//  WookieeTests
//
//  Created by Achraf Trabelsi on 09/05/2022.
//

import XCTest
import DomainKit

class FetchMoviesUseCaseTests: XCTestCase {
    
    func test_execute_whenServiceReturnSuccessWithData_thenFetchMovies() {
        let mockRepository = MockMoviesRepository()
        let sut = DefaultFetchMoviesUseCase(moviesRepository: mockRepository)
        let exp = expectation(description: "Wait for fetch movies completion")
        sut.execute { result in
            switch result {
            case let .success(movies):
                XCTAssertEqual(movies, fakeMovies)
            case let .failure(error):
                XCTFail("Expected success result got \(error) instead")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_execute_whenServiceFails_thenThrowError() {
        let mockRepository = MockMoviesRepositoryError()
        let sut = DefaultFetchMoviesUseCase(moviesRepository: mockRepository)
        let exp = expectation(description: "Wait for fetch movies completion")
        sut.execute { result in
            switch result {
            case let .success(movies):
                XCTFail("Expected success result got success with \(movies) instead")
            case let .failure(error):
                XCTAssertEqual(error as NSError?, anyError())
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
    }
}

final class MockMoviesRepository: MoviesRepository {
    func fetchMovies(completion: @escaping (Result<[FetchedMovie], Error>) -> Void) {
        completion(.success(fakeMovies))
    }
}

final class MockMoviesRepositoryError: MoviesRepository {
    public func fetchMovies(completion: @escaping (Result<[FetchedMovie], Error>) -> Void) {
        completion(.failure(NSError(domain: "any error", code: 0)))
    }
}


func anyError() -> NSError {
    NSError(domain: "any error", code: 0)
}
