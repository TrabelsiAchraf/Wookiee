//
//  FetchMoviesUseCase.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

public protocol FetchMoviesUseCase {
    func execute(completion: @escaping (Result<[FetchedMovie], Error>) -> Void)
}

public final class DefaultFetchMoviesUseCase: FetchMoviesUseCase {
    private let moviesRepository: MoviesRepository
    
    public init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    public func execute(completion: @escaping (Result<[FetchedMovie], Error>) -> Void) {
        moviesRepository.fetchMovies(completion: completion)
    }
}
