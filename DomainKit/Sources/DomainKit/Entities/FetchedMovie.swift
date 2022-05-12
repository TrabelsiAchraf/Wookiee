//
//  FetchedMovie.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

public struct FetchedMovie: Hashable {
    public var id: String?
    public var title: String?
    public var posterURL: URL?
    public var rating: Float?
    public var categories: [String]?
    
    public init(id: String?, title: String?, posterURL: URL?, rating: Float?, categories: [String]?) {
        self.id = id
        self.title = title
        self.posterURL = posterURL
        self.rating = rating
        self.categories = categories
    }
}
