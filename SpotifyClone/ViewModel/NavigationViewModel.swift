//
//  NavigationViewModel.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import Foundation

class NavigationViewModel: ObservableObject {
    @Published var selectedTab: Tabs = .home
    
    func selectTab(tab: Tabs) {
        selectedTab = tab
    }
}
