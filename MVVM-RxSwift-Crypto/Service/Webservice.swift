//
//  Webservice.swift
//  MVVM-RxSwift-Crypto
//
//  Created by Abdurrahman Karaoluk on 22.07.2024.
//

import Foundation

class Webservice {
    
    enum CryptoError: Error {
        case serverError
        case parsingError
    }
    
    func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto], CryptoError>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(.serverError))
            } else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList {
                    completion(.success(cryptoList))
                } else {
                    completion(.failure(.parsingError))
                }
            }
        }.resume()
    }
}
