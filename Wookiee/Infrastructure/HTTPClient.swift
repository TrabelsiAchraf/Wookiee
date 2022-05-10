//
//  HTTPClient.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

protocol HTTPClient {
    func get(from request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}
