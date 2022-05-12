//
//  DefaultDataTransferService.swift
//  Wookiee
//
//  Created by Achraf Trabelsi on 04/05/2022.
//

import Foundation

public enum DataTransferError: Error {
    case noResponse
    case networkFailure
}

public protocol ResponseDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

public protocol DataTransferService {
    func request<T: Decodable>(from request: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}

public final class DefaultDataTransferService {
    public let networkService: HTTPClient
    
    public init(networkService: HTTPClient = URLSessionHTTPClient(session: URLSession.shared)) {
        self.networkService = networkService
    }
}

extension DefaultDataTransferService: DataTransferService {
    private static var OK_200: Int { return 200 }
    
    public func request<T>(from request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        networkService.get(from: request) { result in
            switch result {
            case let .success((data, response)):
                guard response.statusCode == DefaultDataTransferService.OK_200 else {
                    return DispatchQueue.main.async { completion(.failure(DataTransferError.networkFailure)) }
                }
                let result: Result<T, Error> = self.decode(data: data)
                DispatchQueue.main.async { return completion(result) }
            case .failure(let error):
                DispatchQueue.main.async { return completion(.failure(error)) }
            }
        }
    }
    
    private func decode<T: Decodable>(data: Data?) -> Result<T, Error> {
        do {
            guard let data = data else { return .failure(DataTransferError.noResponse) }
            let result: T = try JSONDecoder().decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
