//
//  CryptoViewModel.swift
//  MVVM-RxSwift-Crypto
//
//  Created by Abdurrahman Karaoluk on 22.07.2024.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel {
    
    let cryptos: PublishSubject<[Crypto]> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()
    let loading: PublishSubject<Bool> = PublishSubject()
    
    func requestData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { result in
            switch result {
            case.success(let cryptos):
                self.cryptos.onNext(cryptos)
            case .failure(let error):
                switch error {
                case .parsingError:
                    self.error.onNext("Parsing Error")
                case .serverError:
                    self.error.onNext("Server Error")
                }
            }
        }
    }
}
