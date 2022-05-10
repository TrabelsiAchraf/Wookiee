//
//  FetchMoviesUseCase.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

protocol FetchMoviesUseCase {
    func execute(completion: @escaping (Result<[FetchedMovie], Error>) -> Void)
}

final class DefaultFetchMoviesUseCase: FetchMoviesUseCase {
    private let moviesRepository: MoviesRepository
    
    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    func execute(completion: @escaping (Result<[FetchedMovie], Error>) -> Void) {
        moviesRepository.fetchMovies(completion: completion)
    }
}
