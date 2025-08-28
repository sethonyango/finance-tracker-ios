//
//  AppStateViewModel.swift
//  FinanceTracker
//
//  Created by Gideon Rotich on 28/08/2025.
//
import SwiftUI
import Combine

class AppStateViewModel: ObservableObject {
    @Published var selection: Tab = .home
}

extension AppStateViewModel {
    enum Tab: Hashable {
        case home
        case rates
        case more
    }
}
