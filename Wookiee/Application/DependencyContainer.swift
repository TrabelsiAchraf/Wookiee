//
//  DependencyContainer.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 05/05/2022.
//

import Foundation
import DomainKit
import InfrastructureKit

protocol ViewModelFactory {
    func makeDefaultMoviesViewModel() -> DefaultMoviesViewModel
    func makeMockMoviesViewModel() -> DefaultMoviesViewModel
}

final class DependencyContainer: ViewModelFactory {
    func makeDefaultMoviesViewModel() -> DefaultMoviesViewModel {
        let dataTransferService = DefaultDataTransferService()
        var request = URLRequest(url: URL(string: AppConfiguration.apiBaseURL)!)
        request.addValue(AppConfiguration.auth.value, forHTTPHeaderField: AppConfiguration.auth.header)
        let repository = DefaultMoviesRepository(dataTransferService: dataTransferService, request: request)
        let useCase = DefaultFetchMoviesUseCase(moviesRepository: repository)
        let viewModel = DefaultMoviesViewModel(fetchMoviesUseCase: useCase)
        return viewModel
    }
    
    func makeMockMoviesViewModel() -> DefaultMoviesViewModel {
        let mockUseCase = MockFetchMoviesUseCase()
        let viewModel = DefaultMoviesViewModel(fetchMoviesUseCase: mockUseCase)
        return viewModel
    }
}

// MARK: - MockFetchMoviesUseCase

fileprivate class MockFetchMoviesUseCase: FetchMoviesUseCase {
    func execute(completion: @escaping (Result<[FetchedMovie], Error>) -> Void) {
        completion(.success(fakeMovies))
    }
}
