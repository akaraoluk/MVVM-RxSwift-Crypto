//
//  CryptoViewModel.swift
//  MVVM-RxSwift-Crypto
//
//  Created by Abdurrahman Karaoluk on 22.07.2024.
//

import Foundation

class CryptoViewModel {
    func requestData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { result in
            switch result {
            case.success(let cryptos):
                print(cryptos)
            case .failure(let error):
                print(error)
            }
        }
    }
}
