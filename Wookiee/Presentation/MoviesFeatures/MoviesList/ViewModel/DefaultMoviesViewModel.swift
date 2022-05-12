//
//  MoviesViewModel.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 03/05/2022.
//

import Foundation
import SwiftUI
import Combine
import DomainKit

protocol MoviesViewModelInput {
    func loadView()
}

protocol MoviesViewModelOutput {
    var movies: [String: [FetchedMovie]] { get }
    var allCategories: [String] { get }
    func movie(for category: String) -> [FetchedMovie]
}

protocol MoviesViewModel: MoviesViewModelInput, MoviesViewModelOutput {}

final class DefaultMoviesViewModel: ObservableObject, MoviesViewModel {
    
    @Published private(set) var movies: [String: [FetchedMovie]] = [:]
    
    private let fetchMoviesUseCase: FetchMoviesUseCase
    
    init(fetchMoviesUseCase: FetchMoviesUseCase) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }
}

// MARK: - MoviesViewModelInput

extension DefaultMoviesViewModel: MoviesViewModelInput {
    func loadView() {
        fetchMoviesUseCase.execute { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(movies):
                self.setupMovies(with: movies)
            case let .failure(error):
                debugPrint("Error : \(error)")
            }
        }
    }
    
    var allCategories: [String] { movies.keys.map { $0 } }
    
    func movie(for category: String) -> [FetchedMovie] {
        movies[category] ?? []
    }
    
    private func setupMovies(with moviesList: [FetchedMovie]) {
        // Recuperate all movies categories
        var gategories: Set<String> = []
        for movie in moviesList {
            if let ctgs = movie.categories {
                ctgs.forEach { categorie in
                    gategories.insert(categorie)
                }
            }
        }
        
        // Set movies by category
        gategories.forEach { categorie in
            movies[categorie] = moviesList.filter { $0.categories?.contains(categorie) ?? false }
        }
    }
}
