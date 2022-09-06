//
//  TabManager.swift
//  SpotifyClone
//
//  Created by Berkay Disli on 6.09.2022.
//

import SwiftUI

struct TabManager: View {
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: Displayed Page
            Home()
            
            // MARK: TabView
            tabView
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabManager_Previews: PreviewProvider {
    static var previews: some View {
        TabManager()
            .environmentObject(NavigationViewModel())
    }
}

extension TabManager {
    var tabView: some View {
        HStack {
            ForEach(Tabs.allCases, id: \.self) { tab in
                HStack {
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Image(systemName: navVM.selectedTab == tab ?  "\(tab.icon).fill":tab.icon)
                            .font(.system(size: 30))
                        
                        Text(tab.title)
                            .font(.callout)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            navVM.selectTab(tab: tab)
                        }
                    }

                    
                    Spacer()
                }
            }
        }
        .frame(height: 90)
        .background {
            LinearGradient(colors: [.black, .black, .clear], startPoint: .bottom, endPoint: .top)
        }
    }
}
