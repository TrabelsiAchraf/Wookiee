//
//  MoviesRepository.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

public protocol MoviesRepository {
    func fetchMovies(completion: @escaping (Result<[FetchedMovie], Error>) -> Void)
}
