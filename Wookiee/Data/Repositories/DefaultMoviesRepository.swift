//
//  DefaultMoviesRepository.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

final class DefaultMoviesRepository: MoviesRepository {
    
    private let dataTransferService: DataTransferService
    private let request: URLRequest
    
    init(dataTransferService: DataTransferService, request: URLRequest) {
        self.dataTransferService = dataTransferService
        self.request = request
    }
    
    func fetchMovies(completion: @escaping (Result<[FetchedMovie], Error>) -> Void) {
        dataTransferService.request(from: request) { (result: Result<MovieListResponseDTO, Error>) in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.movies.map { $0.toDomain() } ))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
