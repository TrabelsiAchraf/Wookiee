//
//  AppConfig.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 09/05/2022.
//

import Foundation

final class AppConfiguration {
    static let apiBaseURL: String = { "https://wookie.codesubmit.io/movies" }()
    static let auth: (header: String, value: String) = ("Authorization", "Bearer Wookie2019")
}
