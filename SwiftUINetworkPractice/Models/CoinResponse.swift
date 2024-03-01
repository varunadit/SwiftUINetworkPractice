//
//  CoinResponse.swift
//  SwiftUINetworkPractice
//
//  Created by Varun Adit on 1/19/24.
//

import Foundation

struct CoinResponse: Codable {
    let etheur: Coin?
    let ethusd: Coin?
    
    enum CodingKeys: String, CodingKey {
        case etheur = "ETHEUR"
        case ethusd = "ETHUSD"
    }
}

struct Coin: Identifiable, Codable {
    let id: UUID = UUID()
    let ask: Float?
    let bid: Float?
    let last: Float?
    let high: Float?
    let low: Float?
    let volume: Float?
}
