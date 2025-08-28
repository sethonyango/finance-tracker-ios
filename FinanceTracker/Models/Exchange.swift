//
//  Exchange.swift
//  FinanceTracker
//
//  Created by Gideon Rotich on 28/08/2025.
//

import Foundation

struct Exchange: Hashable, Codable {
    var timestamp: Date
    var base_currency: String // TODO: Use Coding Keys
    var rates: Array<Rate>
}

struct Rate: Hashable, Codable, Identifiable {
    var id: String { currency }
    var currency: String
    var name: String
    var buy_rate: Float
    var sell_rate: Float
}
