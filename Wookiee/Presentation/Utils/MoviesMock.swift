//
//  MoviesMock.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 03/05/2022.
//

import Foundation

let movie1 = FetchedMovie(
    id: UUID().uuidString,
    title: "The Dark Knight",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/d6822b7b-48bb-4b78-ad5e-9ba04c517ec8.jpg")!,
    rating: 9.0,
    categories: ["Action", "Crime", "Drama"]
)

let movie2 = FetchedMovie(
    id: UUID().uuidString,
    title: "Pulp Fiction",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/a9d94d6e-4cab-44a9-8eec-d44ad6332b6d.jpg")!,
    rating: 8.9,
    categories: ["Crime", "Drama"]
)

let movie3 = FetchedMovie(
    id: UUID().uuidString,
    title: "Schindler's List",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/4ec83f0e-eede-4453-8f87-461525e21f6e.jpg")!,
    rating: 8.9,
    categories: ["Biography", "Drama", "History"]
)

let movie4 = FetchedMovie(
    id: UUID().uuidString,
    title: "Spider-Man: Into the Spider-Verse",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/f3d91837-a2ff-4250-99b0-e8c9c036a23a.jpg")!,
    rating: 8.5,
    categories: ["Animation", "Action", "Adventure"]
)

let movie5 = FetchedMovie(
    id: UUID().uuidString,
    title: "Avengers: Infinity War",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/9a70e529-9070-4a2f-963c-c5bb253cc721.jpg")!,
    rating: 8.5,
    categories: ["Action", "Adventure", "Sci-Fi"]
)

let movie6 = FetchedMovie(
    id: UUID().uuidString,
    title: "Raiders of the Lost Ark",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/4d949e14-b08b-47fb-bab0-22c732dbedf3.jpg")!,
    rating: 8.5,
    categories: ["Action", "Adventure"]
)

let movie7 = FetchedMovie(
    id: UUID().uuidString,
    title: "Batman Begins",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/8de5e9be-ec40-4687-9b01-be1af3ace1d7.jpg")!,
    rating: 8.2,
    categories: ["Action", "Adventure"]
)

let movie8 = FetchedMovie(
    id: UUID().uuidString,
    title: "Good Will Hunting",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/554347b2-a340-4e35-b385-07e067ef302a.jpg")!,
    rating: 8.3,
    categories: ["Drama", "Romance"]
)

let movie9 = FetchedMovie(
    id: UUID().uuidString,
    title: "Coco",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/84b17b50-5c6b-4c00-a798-f83ddda0187d.jpg")!,
    rating: 8.4,
    categories: ["Animation", "Adventure", "Family"]
)

let movie10 = FetchedMovie(
    id: UUID().uuidString,
    title: "Taxi Driver",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/372702a0-3e49-4bf3-812a-0c241a8c5ac9.jpg")!,
    rating: 8.3,
    categories: ["Crime", "Drama"]
)

let movie11 = FetchedMovie(
    id: UUID().uuidString,
    title: "A Clockwork Orange",
    posterURL: URL(string: "https://wookie.codesubmit.io/static/posters/0bf56a90-5f7b-4108-9d0b-01ad77f0a310.jpg")!,
    rating: 8.3,
    categories: ["Crime", "Drama", "Sci-Fi"]
)

let fakeMovies: [FetchedMovie] = [
    movie1, movie2, movie3,
    movie4, movie5, movie6,
    movie7, movie8, movie9,
    movie10, movie11
]
