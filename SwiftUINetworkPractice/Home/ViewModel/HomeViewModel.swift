//
//  HomeViewModel.swift
//  SwiftUINetworkPractice
//
//  Created by Varun Adit on 1/19/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var marketsData: [Coin] = [] 
    
    private var canecellables = Set<AnyCancellable>()
    
    init(){
        fetchData()
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchData(type: CoinResponse.self, urlStr: "https://bitcoinaverage-global-ethereum-index-v1.p.rapidapi.com/indices/local/ticker/all?crypto=ETH&fiat=USD%2CEUR")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    debugPrint(error)
                }
            } receiveValue: { [weak self] coinResponse in
                guard let coinResponse, let ethusd = coinResponse.ethusd, let etheur = coinResponse.etheur else {
                    return
                }
                self?.marketsData.append(etheur)
                self?.marketsData.append(ethusd)
                for i in self!.marketsData {
                    print(i.ask!)
                }
            }
            .store(in: &canecellables)
    }
}
