//
//  MovieMapping.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

struct MovieListResponseDTO: Codable {
    let movies: [MovieResponseDTO]
}

struct MovieResponseDTO: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
//        case director
        case classification
        case genres
        case cast
        case rating = "imdb_rating"
        case length
        case overview
        case posterURL = "poster"
        case backdropURL = "backdrop"
        case releasedOn = "released_on"
    }
    
    let id: String?
    let title: String?
//    let director: [String]?
    let classification: String?
    let genres: [String]?
    let cast: [String]?
    let rating: Float?
    let length: String?
    let overview: String?
    let posterURL: String?
    let backdropURL: String?
    let releasedOn: String?
}

extension MovieResponseDTO {
    func toDomain() -> FetchedMovie {
        return .init(id: UUID().uuidString, title: title, posterURL: URL(string: posterURL ?? "no_url"), rating: rating, categories: genres)
    }
}
