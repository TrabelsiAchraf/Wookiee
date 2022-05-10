//
//  FetchedMovie.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

struct FetchedMovie: Hashable {
    var id: String?
    var title: String?
    var posterURL: URL?
    var rating: Float?
    var categories: [String]?
}
